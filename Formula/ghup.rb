# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ghup < Formula
  desc "A GitHub API client for managing tags and repository content from third-party automation systems"
  homepage "https://just.breathe.io/project/ghup/"
  version "0.9.1"

  on_macos do
    on_intel do
      url "https://github.com/nexthink-oss/ghup/releases/download/v0.9.1/ghup_0.9.1_darwin_amd64.zip"
      sha256 "41b6ef4e651816199eb7fb7f3dfb8a81d7b049523bef8590785853d23d928257"

      def install
        bin.install "ghup"
      end
    end
    on_arm do
      url "https://github.com/nexthink-oss/ghup/releases/download/v0.9.1/ghup_0.9.1_darwin_arm64.zip"
      sha256 "0e3cbfc4000ada5cbc1d76fc13e67ca89e03f8fef3baa301ddda731e0a35cd00"

      def install
        bin.install "ghup"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.9.1/ghup_0.9.1_linux_amd64.zip"
        sha256 "2c0639dbcdddda15b980fbeb0b82cb73131cf3ff34aeffd98db71c107fbb9f05"

        def install
          bin.install "ghup"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.9.1/ghup_0.9.1_linux_arm.zip"
        sha256 "59cc6dd44758071aa5cf15aca6e35bf6d7e9c83d2ada50e0c609be1d7e5853cc"

        def install
          bin.install "ghup"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.9.1/ghup_0.9.1_linux_arm64.zip"
        sha256 "936d0b194a6f3567ae3743859768435b2df95fa9d64f017313ba36e0e1beeb66"

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
