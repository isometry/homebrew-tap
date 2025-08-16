# typed: strict
# frozen_string_literal: true

require "abstract_command"
require "formula"
require "keg"
require "utils"
require "system_command"

module Homebrew
  module Cmd
    class Sign < AbstractCommand
      include SystemCommand::Mixin
      cmd_args do
        usage_banner "`sign` [<options>] <formula> [<formula> ...]"
        description <<~EOS
          Sign all executable files installed by the specified formula(e) with code signatures.

          This command finds all executable files installed by the given Homebrew formulae
          and applies code signatures using `codesign`. By default uses ad-hoc signatures#{" "}
          (`-s -`), or a specific identity if provided with `--identity`. This works on both
          compiled binaries and executable scripts, ensuring they work correctly with
          macOS security features.
        EOS

        switch "--force",
               description: "Re-sign files even if they are already signed."
        switch "--dry-run",
               description: "Show what would be signed without actually signing anything."
        switch "--status",
               description: "Show signature status of executables without signing them."
        switch "--verbose", "-v",
               description: "Show detailed output including signature status of each file."
        flag "--identity=",
             description: "Sign with a specific identity instead of ad-hoc. " \
                          "Use '-' for ad-hoc (default), or specify a signing identity " \
                          "from your keychain (e.g., 'Developer ID Application: Your Name')."

        named_args :installed_formula, min: 1
      end

      sig { override.void }
      def run
        # Validate flag combinations
        if args.status? && (args.force? || args.dry_run? || args.identity)
          odie "The --status flag cannot be used with --force, --dry-run, or --identity."
        end

        # Handle status mode early
        if args.status?
          show_status
          return
        end

        # Check if codesign is available (skip in dry-run mode)
        if !args.dry_run? && !which("codesign")
          odie "The `codesign` command is not available. This command requires Xcode Command Line Tools."
        end

        # Get identity, defaulting to ad-hoc ("-")
        identity = args.identity || "-"

        ohai "Dry run mode - showing what would be signed:" if args.dry_run?

        # Show identity being used if not default ad-hoc
        puts "Using signing identity: #{identity}" if identity != "-"

        total_signed = 0
        total_skipped = 0
        total_errors = 0

        args.named.to_latest_kegs.each do |keg|
          puts "Processing formula: #{keg.name}" if args.verbose? || args.dry_run?

          signed, skipped, errors = process_keg(keg, identity)
          total_signed += signed
          total_skipped += skipped
          total_errors += errors
        end

        # Summary
        puts
        if args.dry_run?
          ohai "Summary (dry run):"
          puts "  Would sign: #{total_signed} files"
          puts "  Would skip: #{total_skipped} files (already signed)" if total_skipped.positive?
          puts "  Errors checking: #{total_errors} files" if total_errors.positive?
        else
          ohai "Summary:"
          puts "  Signed: #{total_signed} files"
          puts "  Skipped: #{total_skipped} files (already signed)" if total_skipped.positive?
          puts "  Errors: #{total_errors} files" if total_errors.positive?
        end

        return if total_errors <= 0 || args.dry_run?

        odie "Some files could not be signed. See errors above."
      end

      private

      sig { void }
      def show_status
        args.named.to_latest_kegs.each do |keg|
          show_status_for_keg(keg)
        end
      end

      sig { params(keg: Keg).void }
      def show_status_for_keg(keg)
        puts "Formula: #{keg.name}"

        # Get all files in the keg
        all_files = []
        keg.find { |file| all_files << file if file.file? }

        # Filter for executable files
        executables = find_executables(all_files)

        if executables.empty?
          puts "  No executable files found"
          puts
          return
        end

        executables.each do |executable|
          show_executable_status(executable)
        end

        puts
      end

      sig { params(executable: Pathname).void }
      def show_executable_status(executable)
        relative_path = executable.relative_path_from(HOMEBREW_PREFIX)
        puts "  #{relative_path}"

        signature_details = get_signature_details(executable)

        case signature_details[:status]
        when :signed
          puts "    Status: Signed"
          puts "    Identity: #{signature_details[:identity]}" if signature_details[:identity]
          puts "    Team ID: #{signature_details[:team_id]}" if signature_details[:team_id]
          puts "    Signed: #{signature_details[:signed_time]}" if signature_details[:signed_time]
          puts "    Type: #{signature_details[:signature_type]}" if signature_details[:signature_type]
        when :unsigned
          puts "    Status: Unsigned"
        when :error
          puts "    Status: Error (#{signature_details[:error]})"
        end
      end

      sig { params(executable: Pathname).returns(T::Hash[Symbol, T.nilable(String)]) }
      def get_signature_details(executable)
        result = system_command("codesign", args: ["-dv", "--verbose=2", executable.to_s], print_stderr: false)

        if result.success?
          # Parse the codesign output for details - output can be in stdout or stderr
          output = result.stdout + result.stderr
          details = { status: :signed }

          output.each_line do |line|
            case line.strip
            when /^Authority=(.+)$/
              # Use the first Authority line (the signing identity)
              details[:identity] ||= Regexp.last_match(1)
            when /^TeamIdentifier=(.+)$/
              team_id = Regexp.last_match(1)
              details[:team_id] = team_id if team_id != "not set"
            when /^Signed Time=(.+)$/
              details[:signed_time] = Regexp.last_match(1)
            when /^Signature=(.+)$/
              details[:signature_type] = Regexp.last_match(1)
            end
          end

          # If no Authority found but signature exists, it's ad-hoc
          if !details[:identity] && (output.include?("Signature=adhoc") || output.include?("flags=0x2(adhoc)"))
            details[:signature_type] = "ad-hoc"
          end

          details
        elsif result.stderr.include?("code object is not signed")
          { status: :unsigned }
        else
          { status: :error, error: result.stderr.strip }
        end
      rescue => e
        { status: :error, error: e.message }
      end

      sig { params(keg: Keg, identity: String).returns([Integer, Integer, Integer]) }
      def process_keg(keg, identity)
        signed_count = 0
        skipped_count = 0
        error_count = 0

        # Get all files in the keg
        all_files = []
        keg.find { |file| all_files << file if file.file? }

        if all_files.empty?
          puts "  No files found for formula #{keg.name}" if args.verbose? || args.dry_run?
          return [0, 0, 0]
        end

        # Filter for executable files
        executables = find_executables(all_files)

        if executables.empty?
          puts "  No executable files found for formula #{keg.name}" if args.verbose? || args.dry_run?
          return [0, 0, 0]
        end

        puts "  Found #{executables.length} executable file(s)" if args.verbose? || args.dry_run?

        executables.each do |executable|
          result = process_executable(executable, identity)
          case result
          when :signed
            signed_count += 1
          when :skipped
            skipped_count += 1
          when :error
            error_count += 1
          end
        end

        [signed_count, skipped_count, error_count]
      end

      sig { params(files: T::Array[Pathname]).returns(T::Array[Pathname]) }
      def find_executables(files)
        files.select do |file|
          # Only process regular files that exist and are executable
          file.exist? && file.file? && !file.symlink? && file.executable?
        end
      end

      sig { params(executable: Pathname, identity: String).returns(Symbol) }
      def process_executable(executable, identity)
        relative_path = executable.relative_path_from(HOMEBREW_PREFIX)

        # Check current signature status (skip in dry-run for speed, unless verbose)
        if args.dry_run? && !args.verbose?
          puts "  Would sign: #{relative_path}"
          return :signed
        end

        signature_status = check_signature(executable)

        case signature_status
        when :signed
          if args.force?
            if args.dry_run?
              puts "  Would re-sign: #{relative_path} (already signed, --force specified)"
            else
              puts "  Re-signing: #{relative_path}"
            end
            sign_executable(executable, relative_path, identity)
          else
            if args.verbose? || args.dry_run?
              puts "  #{args.dry_run? ? "Would skip" : "Already signed"}: #{relative_path}"
            end
            :skipped
          end
        when :unsigned
          if args.dry_run?
            puts "  Would sign: #{relative_path} (unsigned)"
          else
            puts "  Signing: #{relative_path}"
          end
          sign_executable(executable, relative_path, identity)
        when :error
          onoe "Could not check signature status of #{relative_path}"
          :error
        end
      end

      sig { params(executable: Pathname).returns(Symbol) }
      def check_signature(executable)
        # Use codesign to check signature status
        result = system_command("codesign", args: ["-dv", executable.to_s], print_stderr: false)

        if result.success?
          # If codesign -dv succeeds, the file is signed
          :signed
        elsif result.stderr.include?("code object is not signed")
          # Check the error message to distinguish between unsigned and error
          :unsigned
        else
          :error
        end
      rescue
        :error
      end

      sig { params(executable: Pathname, relative_path: Pathname, identity: String).returns(Symbol) }
      def sign_executable(executable, relative_path, identity)
        return :signed if args.dry_run?

        # Apply signature with specified identity
        result = system_command("codesign", args: ["-s", identity, "-f", executable.to_s], print_stderr: false)

        if result.success?
          puts "  ✓ Signed: #{relative_path}" if args.verbose?
          :signed
        else
          onoe "Failed to sign #{relative_path}: #{result.stderr.strip}"
          :error
        end
      rescue => e
        onoe "Error signing #{relative_path}: #{e.message}"
        :error
      end
    end
  end
end
