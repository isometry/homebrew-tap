# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ghup < Formula
  desc "A GitHub API client for managing tags and repository content from third-party automation systems"
  homepage "https://just.breathe.io/project/ghup/"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/nexthink-oss/ghup/releases/download/v0.12.0/ghup_0.12.0_darwin_amd64.zip"
      sha256 "e117f460f3b7c458c2f6c8c0eb0c3c451115e4e12f7b949a256d33b81a8f8931"

      def install
        bin.install "ghup"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/nexthink-oss/ghup/releases/download/v0.12.0/ghup_0.12.0_darwin_arm64.zip"
      sha256 "083ffb662872de6707b03c0853f419509e603aa7c53ea24d48403290180cd6ed"

      def install
        bin.install "ghup"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.12.0/ghup_0.12.0_linux_amd64.zip"
        sha256 "20b9af46a85f8fb462c61781be70bbceee327f2749525eac49f38dc0802e6cec"

        def install
          bin.install "ghup"
        end
      end
    end
    if Hardware::CPU.arm?
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.12.0/ghup_0.12.0_linux_arm.zip"
        sha256 "61a422c4874fe0d923dc44547360122830a5ac668e686df3eadc7fb6fe139317"

        def install
          bin.install "ghup"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.12.0/ghup_0.12.0_linux_arm64.zip"
        sha256 "066d22f108030f39b506c1245c684569246292ca1f77e06a7e6360ef5af65e8f"

        def install
          bin.install "ghup"
        end
      end
    end
  end

  test do
    system "#{bin}/ghup --help"
  end
end
