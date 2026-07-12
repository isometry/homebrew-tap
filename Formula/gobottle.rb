class Gobottle < Formula
  desc "Build and publish Homebrew bottles for Go projects"
  homepage "https://github.com/isometry/gobottle"
  url "https://github.com/isometry/gobottle/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ff598286faf62f7fecf18dffaaeca1cc0a119d1b8b030a9572f43b680de37964"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, monterey: "da3cb1d0081afa4dc3b74f5cc942d0b4968b6eb15cde5555944601de60df834a"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "96488ee6f8496bf8a4861eceda64870ff6f6a30c6d9a09c0e9eb07c41ef31a91"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ca8ec02283c70c45879d42b6f1b49e4d27e72ab14d9be040572bbb6dbc31c0d1"
    sha256 cellar: :any_skip_relocation, aarch64_linux: "e9b3b02ae9202e45d63175d1d89668a303feb3214db2cfe3e6a6e8459a44469a"
  end

  def install
    bin.install "gobottle"
    generate_completions_from_executable(bin/"gobottle", "completion")
  end

  test do
    system bin/"gobottle", "version"
  end
end
