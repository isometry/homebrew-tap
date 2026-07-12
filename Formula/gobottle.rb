class Gobottle < Formula
  desc "Build and publish Homebrew bottles for Go projects"
  homepage "https://github.com/isometry/gobottle"
  url "https://github.com/isometry/gobottle/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "02cf62453c87487bdf9616d2a549fc63e2058ee8ac329ea063f21b6cf4825eb8"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, monterey: "2aad6f9de8f1d80ba72ca5474e19a407080f9e0f3a0ef28fde19759ef60226f7"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "858354cb16b60958e7171d3b66809a9c1412d9d5c1bd8736566606199514bda3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "106677d14dd7e8c4719df248e34ad2d46653149bc6e5575f057db2a65bdad3c0"
    sha256 cellar: :any_skip_relocation, aarch64_linux: "83f92ddadc5610c210f14eb2f016ee37b25189dbcd424a29ace55d1f96d2ed8a"
  end

  def install
    bin.install "gobottle"
    generate_completions_from_executable(bin/"gobottle", "completion")
  end

  test do
    system bin/"gobottle", "version"
  end
end
