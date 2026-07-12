class VaultSshPlus < Formula
  desc "Automatically use HashiCorp Vault SSH Client Key Signing with ssh(1)"
  homepage "https://just.breathe.io/project/vault-ssh-plus/"
  url "https://github.com/isometry/vault-ssh-plus/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "707a464389f9046260556a63131c7f3768d030e1ed41b52e2e139e8a629ca99b"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, monterey: "72122f3ebc0ddf432bff31d8d940a0e36fc2827bb3180d72b1ab1ca00037b949"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "fd0bc708565a8a796b1f72215b556a63d7728d6cc64b2abc2e173267629119f5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac74f22a1fb2b352c9238f0a02778ed95b4b7198286a620c2b8c4f7f09564781"
    sha256 cellar: :any_skip_relocation, aarch64_linux: "7c3875eece18bf2520df5d29d6b5858061418370a65c18f7db0b6fdfdb05b456"
  end

  def install
    bin.install "vssh"
  end

  def caveats
    <<~EOS
      vssh requires the vault binary to be in your PATH.
      You can install it with:
        brew install hashicorp/tap/vault
    EOS
  end

  test do
    system bin/"vssh", "--version"
  end
end
