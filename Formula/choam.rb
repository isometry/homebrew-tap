class Choam < Formula
  desc "Track updates for melange build specification files"
  homepage "https://just.breathe.io/project/choam/"
  url "https://github.com/isometry/choam/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "edb1a1839895578ad0326fb0d839a6daea9dc328292cd5c9d43f345bee9572c0"
  license "MIT"
  head "https://github.com/isometry/choam.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5ed3ee67f9fa50d8f20895e5f3d44965159c120b587ba2d5fd673e7d21e1f74e"
    sha256 cellar: :any_skip_relocation, monterey:       "326c657ee6b8b20113d1abd15b39b55719820bf30331f51260bd38f3536859f1"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "3d36a3913a8daa83a7e3724245516d214155b710f4a0aa05f2649fa03760bcb3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "fd541cc8d927503220285f7fc150c41311f6e8d087ef5f21ec21ab6afb513be9"
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
