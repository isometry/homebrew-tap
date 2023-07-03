# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class VaultSshPlus < Formula
  desc "Automatically use HashiCorp Vault SSH Client Key Signing with ssh(1)"
  homepage "https://just.breathe.io/project/vault-ssh-plus/"
  version "0.7.0"

  depends_on "vault"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/isometry/vault-ssh-plus/releases/download/v0.7.0/vault-ssh-plus_0.7.0_darwin_amd64.zip"
      sha256 "880d5e0557c35a915136b87d7f30a5c88aaad9ee7b6f44a6e9bab9584378c14b"

      def install
        bin.install "vssh"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/isometry/vault-ssh-plus/releases/download/v0.7.0/vault-ssh-plus_0.7.0_darwin_arm64.zip"
      sha256 "b84132319b5d724deb8b3c4d7cca10f71a8e6695e0f0b1caf22789e2c8fd4e59"

      def install
        bin.install "vssh"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/isometry/vault-ssh-plus/releases/download/v0.7.0/vault-ssh-plus_0.7.0_linux_amd64.zip"
      sha256 "e0984101cb48a177eb4da64461bc3bcb49a48321b3fa194e768e691aa1b853b8"

      def install
        bin.install "vssh"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/isometry/vault-ssh-plus/releases/download/v0.7.0/vault-ssh-plus_0.7.0_linux_arm64.zip"
      sha256 "f6d888954635ddae4a3418d4a1b7287eee03ea4b310cffb51f0c37812cb952e9"

      def install
        bin.install "vssh"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/isometry/vault-ssh-plus/releases/download/v0.7.0/vault-ssh-plus_0.7.0_linux_arm.zip"
      sha256 "0c46f1e973da22240719ef81fdfb9756ffdbfcfaa3aa3e1a9c5e7bc8cbe21b36"

      def install
        bin.install "vssh"
      end
    end
  end

  test do
    system "#{bin}/vssh --version"
  end
end
