class Choam < Formula
  desc "Track updates for melange build specification files"
  homepage "https://just.breathe.io/project/choam/"
  url "https://github.com/isometry/choam/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "bc6a3ff44bdd7bc4948799ffcc54d514d2747f14bd03f941fe4d510fee740a6a"
  license "MIT"
  head "https://github.com/isometry/choam.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "516a94fddf7467b5776e29545abdaf1d8d25d1c4f0f2c8a24e596e5b580db767"
    sha256 cellar: :any_skip_relocation, monterey:       "a13b109d75e9d8a69d7e2f0ddd2e320654569378e85a75713ea614eead04b90f"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "d6efd00891cb795f551b855ad77e444c0d1e3816015fd78df720243fe5921f70"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c7d7124e61a94d6180998a2dcd0f9d7319748d29ec38da2bf8342408c7224b43"
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
