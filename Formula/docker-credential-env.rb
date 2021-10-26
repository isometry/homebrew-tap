# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class DockerCredentialEnv < Formula
  desc "Environment-driven Docker credential helper"
  homepage "https://just.breathe.io/project/docker-credential-env/"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/isometry/docker-credential-env/releases/download/v1.1.0/docker-credential-env_1.1.0_darwin_arm64.zip"
      sha256 "1c3b5626f53aea4886cfdddbda145f895e5cdc036e251e5bd40a8943c896fb83"

      def install
        bin.install "docker-credential-env"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/isometry/docker-credential-env/releases/download/v1.1.0/docker-credential-env_1.1.0_darwin_amd64.zip"
      sha256 "389218eaa6d382567060154d80033c1cec3d863daa3747e718c2349b199bb3d8"

      def install
        bin.install "docker-credential-env"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/isometry/docker-credential-env/releases/download/v1.1.0/docker-credential-env_1.1.0_linux_amd64.zip"
      sha256 "f1f8fac454efaab5d7ece5ccaebcd06d858c1cd32cb14f51642402e1181f6a28"

      def install
        bin.install "docker-credential-env"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/isometry/docker-credential-env/releases/download/v1.1.0/docker-credential-env_1.1.0_linux_arm64.zip"
      sha256 "564a19088efab82f2e82bfe81a856bbf1bc34cf5f89e63068f281b0de17d7a8d"

      def install
        bin.install "docker-credential-env"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/isometry/docker-credential-env/releases/download/v1.1.0/docker-credential-env_1.1.0_linux_arm.zip"
      sha256 "3c72dbdb0e63ac539bf6242c4b30c95194a10fa26cb3044bd1da1457cd8455d6"

      def install
        bin.install "docker-credential-env"
      end
    end
  end

  test do
    system "#{bin}/docker-credential-env --version"
  end
end
