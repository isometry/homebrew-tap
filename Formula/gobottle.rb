class Gobottle < Formula
  desc "Build and publish Homebrew bottles for Go projects"
  homepage "https://github.com/isometry/gobottle"
  url "https://github.com/isometry/gobottle/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "5effc668168076e907616b7ae032b20b13e9b3e1bfed9c25562a6f3f6600ecf5"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, monterey: "06a10ce224fcb94873c27420111d0d680d8363e07118568ba67669dec3a25c92"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "9f384fdff17388c7c2a5880753e81ec3497fcf3231812916a2e60ae36f04a435"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "131aac030655371a8a0635f586ff0f0cdf0ecd426fd9eb40c567b1ff202d1c47"
    sha256 cellar: :any_skip_relocation, aarch64_linux: "088e721a2c0b59c3b41e3777f980b8f607aa789323ee69cf521bd4d137f99060"
  end

  def install
    bin.install "gobottle"
    generate_completions_from_executable(bin/"gobottle", "completion")
  end

  test do
    system bin/"gobottle", "version"
  end
end
