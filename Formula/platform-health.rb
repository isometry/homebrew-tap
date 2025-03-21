# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class PlatformHealth < Formula
  desc "Platform health monitoring system"
  homepage "https://just.breathe.io/project/platform-health/"
  version "0.5.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/isometry/platform-health/releases/download/v0.5.4/platform-health_0.5.4_darwin_amd64.zip"
      sha256 "ec144daee4719a579dd5c42a6b0ad84d89b6e3faa110e3c0d19f22699f81abaf"

      def install
        bin.install "phc"
        bin.install "phs"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/isometry/platform-health/releases/download/v0.5.4/platform-health_0.5.4_darwin_arm64.zip"
      sha256 "c2cff312a713e62899da692b8a8a82042f32ff9c34f4f5ff112f0958f4e2ec2e"

      def install
        bin.install "phc"
        bin.install "phs"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/isometry/platform-health/releases/download/v0.5.4/platform-health_0.5.4_linux_amd64.zip"
        sha256 "67f5c85000619432c15ae8aec6d274d3983702d1155e881c845615f87ea98c3c"

        def install
          bin.install "phc"
          bin.install "phs"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/isometry/platform-health/releases/download/v0.5.4/platform-health_0.5.4_linux_arm64.zip"
        sha256 "7aa3f2ae4d2ee8f01d8e3ecd9ae41708ec6790a3c3d8a665726503f1bb1fa856"

        def install
          bin.install "phc"
          bin.install "phs"
        end
      end
    end
  end
end
