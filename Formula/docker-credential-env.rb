# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class DockerCredentialEnv < Formula
  desc "Environment-driven Docker credential helper"
  homepage "https://just.breathe.io/project/docker-credential-env/"
  version "1.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/isometry/docker-credential-env/releases/download/v1.2.4/docker-credential-env_1.2.4_darwin_arm64.zip"
      sha256 "acb57415aec037f7728bfec3d9fc75349f3daeb38d7e8e87447f0b115b990390"

      def install
        bin.install "docker-credential-env"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/isometry/docker-credential-env/releases/download/v1.2.4/docker-credential-env_1.2.4_darwin_amd64.zip"
      sha256 "1ad707d73b72a989eb99c9b1122e9bf26e64e8a069d78e8360858cd92cfbf6ef"

      def install
        bin.install "docker-credential-env"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/isometry/docker-credential-env/releases/download/v1.2.4/docker-credential-env_1.2.4_linux_amd64.zip"
      sha256 "efa69857401308885e89ed9ad46fcfb95f6dc0703985bf6d784ff199f0e5d931"

      def install
        bin.install "docker-credential-env"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/isometry/docker-credential-env/releases/download/v1.2.4/docker-credential-env_1.2.4_linux_arm64.zip"
      sha256 "fed11da63c3b1ecf063d0b90cd78f35dc392862dd67a0c7dd4ac738865dd642a"

      def install
        bin.install "docker-credential-env"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/isometry/docker-credential-env/releases/download/v1.2.4/docker-credential-env_1.2.4_linux_arm.zip"
      sha256 "e68c4ab0e94e49d0a1e7bb31b4892d29efea22c61ab4992811f36643ee851f5a"

      def install
        bin.install "docker-credential-env"
      end
    end
  end

  test do
    system "#{bin}/docker-credential-env --version"
  end
end
