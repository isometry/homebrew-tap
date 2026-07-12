class Gobottle < Formula
  desc "Build and publish Homebrew bottles for Go projects"
  homepage "https://github.com/isometry/gobottle"
  url "https://github.com/isometry/gobottle/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "de5cbc4b5e072daf313251c4554fbf78a8a4ff7a255f1135c09a5c826be7a670"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, monterey: "d89af2c823fe5aa3acfc219bf5b96b6a06061612bb5fd286f5480b6ad927c072"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "2e50fd13c15901be1ae86e24d13465a5157c582e92d65869739623f3007208fb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8b5883e85f303560c48b3a831940ecd25101b6a22b4b884bce10a5b21fe3bfa9"
    sha256 cellar: :any_skip_relocation, aarch64_linux: "1f6bd21641a0e7f9750904b0045d5006fa01f6fd18deaab4320fe49ec3ed9724"
  end

  def install
    bin.install "gobottle"
    generate_completions_from_executable(bin/"gobottle", "completion")
  end

  test do
    system bin/"gobottle", "version"
  end
end
