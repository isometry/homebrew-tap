# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class PlatformHealth < Formula
  desc "Platform health monitoring system"
  homepage "https://just.breathe.io/project/platform-health/"
  version "0.4.6"

  on_macos do
    on_intel do
      url "https://github.com/isometry/platform-health/releases/download/v0.4.6/platform-health_0.4.6_darwin_amd64.zip"
      sha256 "8b7f445ed39aa93566966f823d73b2775920146c589e0360970b9a20f31d36b3"

      def install
        bin.install "phc"
        bin.install "phs"
      end
    end
    on_arm do
      url "https://github.com/isometry/platform-health/releases/download/v0.4.6/platform-health_0.4.6_darwin_arm64.zip"
      sha256 "32fe458084237bb7462ce87dd7f720698546a8c131f1654bad26fba2e7e314e7"

      def install
        bin.install "phc"
        bin.install "phs"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/isometry/platform-health/releases/download/v0.4.6/platform-health_0.4.6_linux_amd64.zip"
        sha256 "500bc93089c324f80b74d44809fd93cba85d11d11fbd8af7eff9b95a1a598a32"

        def install
          bin.install "phc"
          bin.install "phs"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/isometry/platform-health/releases/download/v0.4.6/platform-health_0.4.6_linux_arm64.zip"
        sha256 "a3a1ae908a2a8c48bb50bf268512ba8ae6a8bba98fa72eb2ec71d8f212419d80"

        def install
          bin.install "phc"
          bin.install "phs"
        end
      end
    end
  end
end
