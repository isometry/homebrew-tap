class KmsImport < Formula
  desc "Idempotently import locally-held private keys into AWS KMS"
  homepage "https://github.com/isometry/kms-import"
  url "https://github.com/isometry/kms-import/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2c4a1f0caa4b2e2e83846aa67e5ec3cf94f47b72275e096b4608b0fabba3be06"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, monterey: "c15905f108fa2718b4ee7ad1612dd80ae89d8623a2d7d1929662c313325f34ca"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "2b3bda12b37ce5a67c4950bfa1b0bede789a5b1c7b75408e5d15bb1f06314b70"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f69c9f0d24d182294cc0c2c85da0901b89b0c296357a582f590940a9d861d4c1"
    sha256 cellar: :any_skip_relocation, aarch64_linux: "2a2ddd2c798f8e78fdbe2761e38a82e2311dcd55ccbe9cddeb61f1c4cdf8ea42"
  end

  def install
    bin.install "kms-import"
    generate_completions_from_executable(bin/"kms-import", "completion")
  end

  test do
    system bin/"kms-import", "--version"
  end
end
