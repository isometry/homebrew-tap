class Choam < Formula
  desc "Track updates for melange build specification files"
  homepage "https://just.breathe.io/project/choam/"
  url "https://github.com/isometry/choam/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "ace31a4d551f481875448b05bdb0b6b0df4006b459b3a604cbb6d0353aaaef5b"
  license "MIT"
  head "https://github.com/isometry/choam.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5ddc34c9cdf7c8404b8cd536181b0d13591eff0ae78b7412a4ceac6f57fc394f"
    sha256 cellar: :any_skip_relocation, monterey:       "6065d83ef71bb90f77ea619a39864d61097f33ca09e59ba492c1f191c7c1a477"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "632e1b7e1e5d2d8f493a3942a9d386f0fd50509b118fd098f09a93430f22fdb6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "3bd49e7d5288e9211e1e6b4cba0c6fb72113d296c1e9131795cd9fd772f022c3"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(), "."
    generate_completions_from_executable(bin/"choam", "completion")
  end

  test do
    system bin/"choam", "--help"
  end
end
