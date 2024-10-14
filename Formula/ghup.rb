# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ghup < Formula
  desc "A GitHub API client for managing tags and repository content from third-party automation systems"
  homepage "https://just.breathe.io/project/ghup/"
  version "0.11.1"

  on_macos do
    on_intel do
      url "https://github.com/nexthink-oss/ghup/releases/download/v0.11.1/ghup_0.11.1_darwin_amd64.zip"
      sha256 "f0874efea03a87569c166be22f2a373e43aae48f36ef0e2b56aaf2994d61788b"

      def install
        bin.install "ghup"
      end
    end
    on_arm do
      url "https://github.com/nexthink-oss/ghup/releases/download/v0.11.1/ghup_0.11.1_darwin_arm64.zip"
      sha256 "2afde6045a53d33efdf286bc8815149b7faf979b195ff69dbd9c8eb9ac77491e"

      def install
        bin.install "ghup"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.11.1/ghup_0.11.1_linux_amd64.zip"
        sha256 "ffe70f2958085f0eda1c7a02c596db5cf1b89384b4f25a598c44e0a16803d573"

        def install
          bin.install "ghup"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.11.1/ghup_0.11.1_linux_arm.zip"
        sha256 "1742a10fb614ed95d1b515cd55346fd2e77dffdafba1748729565dabc0c003d1"

        def install
          bin.install "ghup"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.11.1/ghup_0.11.1_linux_arm64.zip"
        sha256 "244f4b0b07976444ea4aa5c71ba31a5e8629cc2dd66d80046ded55f51083368d"

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
