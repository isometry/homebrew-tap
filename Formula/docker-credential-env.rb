class DockerCredentialEnv < Formula
  desc "Environment-driven Docker credential helper"
  homepage "https://just.breathe.io/project/docker-credential-env/"
  url "https://github.com/isometry/docker-credential-env/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "96745058f2979ee954cdd9cc37ab59c975502b2886f652988539f1b2cda9b21c"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, monterey: "e3646aa6d32b64653ee2d6a838052d7e65132c3edaf6ff37b4bc708886f7ae53"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "4387ad2ed9ec57218bed943e8ef283e2c7242e041974589508c9cf336d3b10ab"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4234dae757bd48d0d2077602281ab1c6e686632007b94a8100b99e69c7684d79"
    sha256 cellar: :any_skip_relocation, aarch64_linux: "20fe44d3577f6ffb6fab36786aa8e4e3fb39b3bf60710c7c3b38b1309a8e165a"
  end

  def install
    bin.install "docker-credential-env"
  end

  test do
    system bin/"docker-credential-env", "--version"
  end
end
