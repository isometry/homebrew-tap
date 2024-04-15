# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class PlatformHealth < Formula
  desc "Platform health monitoring system"
  homepage "https://just.breathe.io/project/platform-health/"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/isometry/platform-health/releases/download/v0.4.0/platform-health_0.4.0_darwin_amd64.zip"
      sha256 "0fe3f9dae730daba665295ae7306d01bffb23046673c2f307b2a8b3accfddfb0"

      def install
        bin.install "phc"
        bin.install "phs"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/isometry/platform-health/releases/download/v0.4.0/platform-health_0.4.0_darwin_arm64.zip"
      sha256 "6caeef6b3297d0347eda54c2b99d66689ed2e0728dce3d31a2d3de9f1dfb9d69"

      def install
        bin.install "phc"
        bin.install "phs"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/isometry/platform-health/releases/download/v0.4.0/platform-health_0.4.0_linux_amd64.zip"
      sha256 "e38db03cb307f4451aa87cec70908254d5b6cbc1a47b4f553f7ca552617adbd9"

      def install
        bin.install "phc"
        bin.install "phs"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/isometry/platform-health/releases/download/v0.4.0/platform-health_0.4.0_linux_arm64.zip"
      sha256 "d4c73c6d6a6b57b8fa02b6eb77c6f06d722fa1ff2dca5c53a997f558d811df96"

      def install
        bin.install "phc"
        bin.install "phs"
      end
    end
  end
end
