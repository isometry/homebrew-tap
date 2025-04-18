# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Bitrat < Formula
  desc "Lightning-fast, multi-algorithm file checksums"
  homepage "https://just.breathe.io/project/bitrat/"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/isometry/bitrat/releases/download/v0.1.1/bitrat_0.1.1_darwin_amd64.zip"
      sha256 "21ea0abbf0cdc35cac66df52325d2354bc148e33383fddc5d311c74832cb448d"

      def install
        bin.install "bitrat"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/isometry/bitrat/releases/download/v0.1.1/bitrat_0.1.1_darwin_arm64.zip"
      sha256 "7a1c5718552d40c779d822209ef34c2a0b8042d90105eb7cf7abe408940b3f03"

      def install
        bin.install "bitrat"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/isometry/bitrat/releases/download/v0.1.1/bitrat_0.1.1_linux_amd64.zip"
        sha256 "dc23f19af8d5510a066c764c6ba617db404ea1c0ab6fe10f56988621a5929eab"

        def install
          bin.install "bitrat"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/isometry/bitrat/releases/download/v0.1.1/bitrat_0.1.1_linux_arm64.zip"
        sha256 "ed7f64f5d67a7d9f2ee29be593fd3e326d128800a71eea0335625f3916731f30"

        def install
          bin.install "bitrat"
        end
      end
    end
  end

  test do
    system "#{bin}/bitrat --help"
  end
end
