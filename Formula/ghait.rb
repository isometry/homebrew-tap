# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ghait < Formula
  desc "Easily generate GitHub App Installation Tokens"
  homepage "https://just.breathe.io/project/ghait/"
  version "0.4.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/isometry/ghait/releases/download/v0.4.5/ghait_0.4.5_darwin_amd64.zip"
      sha256 "b52e6c71ee7aaa6486220eb9fce160123fc2e59f4cfe6fd1d3bc967f62bf0063"

      def install
        bin.install "ghait"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/isometry/ghait/releases/download/v0.4.5/ghait_0.4.5_darwin_arm64.zip"
      sha256 "e4c18d0eb204cd33b0918a7afedffa3a918c7da8d2cb710bf68a22518c900326"

      def install
        bin.install "ghait"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/isometry/ghait/releases/download/v0.4.5/ghait_0.4.5_linux_amd64.zip"
      sha256 "300659a54ba9d151f4a629feff996aef9dc944152bdc280b06841f45367189f7"
      def install
        bin.install "ghait"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/isometry/ghait/releases/download/v0.4.5/ghait_0.4.5_linux_arm64.zip"
      sha256 "f1f317dcb5645739ee66a4cbd5b12c7c2655975d7a6e9621142c3b84c280c102"
      def install
        bin.install "ghait"
      end
    end
  end

  test do
    system "#{bin}/ghait --help"
  end
end
