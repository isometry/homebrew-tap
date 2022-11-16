# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ghup < Formula
  desc "A GitHub API client for managing tags and repository content from third-party automation systems"
  homepage "https://just.breathe.io/project/ghup/"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/isometry/ghup/releases/download/v0.1.0/ghup_0.1.0_darwin_amd64.zip"
      sha256 "a4be11069d31150dcadd9cac7b79362e366bca402f5471b3b4a63202244a261e"

      def install
        bin.install "ghup"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/isometry/ghup/releases/download/v0.1.0/ghup_0.1.0_darwin_arm64.zip"
      sha256 "ab20f2e6a8c2e7afb6696cc34f1c1a029dd58a1192f1086ac5af264077048af4"

      def install
        bin.install "ghup"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/isometry/ghup/releases/download/v0.1.0/ghup_0.1.0_linux_arm64.zip"
      sha256 "b24221369b2ebf35079ef9f0d39227d11980987c057df8ed00d650f09da7d3ad"

      def install
        bin.install "ghup"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/isometry/ghup/releases/download/v0.1.0/ghup_0.1.0_linux_amd64.zip"
      sha256 "5e5d6ae02302ed4ae7ef5393000dd1094ccaf350cdea72ce5bebe17b9545b29a"

      def install
        bin.install "ghup"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/isometry/ghup/releases/download/v0.1.0/ghup_0.1.0_linux_arm.zip"
      sha256 "2410a03ebc28c45eaa571a1ca88f7717718723c29e052f35048dc7bb29cbca75"

      def install
        bin.install "ghup"
      end
    end
  end

  test do
    system "#{bin}/ghup --help"
  end
end
