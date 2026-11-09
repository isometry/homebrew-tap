class DockerCredentialEnv < Formula
  desc "Environment-driven Docker credential helper"
  homepage "https://just.breathe.io/project/docker-credential-env/"
  url "https://github.com/isometry/docker-credential-env/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "7ded3a70d2a4e4a7aad680407eda1f8cfd2a2346e7282b4c031ae3fc364e683e"
  license "MIT"
  head "https://github.com/isometry/docker-credential-env.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "bddcba36806dfe9b1fac8e057260f469e3a749a4c1c4e460e945e6593f843574"
    sha256 cellar: :any_skip_relocation, monterey:       "c7a29563833da084eca87aa135e61dd8b67de522fe2467e1071efc014359288f"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "8eedbdd07a6c779ea5081f8dbe56b7f748ad400e0615ee1e7c12c88f608ff7f9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e6a56b5fda4b750bbadde55565efc9f83dbb5711d6fccaf93ae81664cbb2a338"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(), "."
  end

  test do
    system bin/"docker-credential-env", "--version"
  end
end
