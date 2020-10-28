# This file was generated by GoReleaser. DO NOT EDIT.
class VaultSshPlus < Formula
  desc "Automatically use HashiCorp Vault SSH Client Key Signing with ssh(1)"
  homepage "https://just.breathe.io/project/vault-ssh-plus/"
  version "0.2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/isometry/vault-ssh-plus/releases/download/v0.2.0/vault-ssh-plus_0.2.0_darwin_amd64.zip"
    sha256 "23ef1b79dbd4f62fbef2fd890ea739632d863a07b4ca7bba7ee54b5fd04e7e1e"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/isometry/vault-ssh-plus/releases/download/v0.2.0/vault-ssh-plus_0.2.0_linux_amd64.zip"
      sha256 "e862859be966a78ab0d8515ef36b01ae4104d50d59d0315a7df1411667111340"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/isometry/vault-ssh-plus/releases/download/v0.2.0/vault-ssh-plus_0.2.0_linux_arm64.zip"
        sha256 "5e656805232ef6d48b48104255435a6629f75e0ad9dcd69149d4075727807778"
      else
        url "https://github.com/isometry/vault-ssh-plus/releases/download/v0.2.0/vault-ssh-plus_0.2.0_linux_arm.zip"
        sha256 "d3536fb33bbc39513f799ad36de2b02b462af27278819c5b10a2f0acf2cb9b3c"
      end
    end
  end
  
  depends_on "vault"

  def install
    bin.install "vssh"
  end
end
