class Wfctl < Formula
  desc "Inspect and operate a Wavefront progressive-delivery fleet"
  homepage "https://github.com/isometry/wavefront-controller"
  url "https://github.com/isometry/wavefront-controller/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "f7afe018b4f0e99e391d213ce1ab17ab91a41e6adb56fb37bb0b8b042140da40"
  license "Apache-2.0"
  head "https://github.com/isometry/wavefront-controller.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "c448035c46a4c34efe7dcfe2ef161b9b67932535f542938e59dd5641f7f13fb7"
    sha256 cellar: :any_skip_relocation, monterey:       "5df4a38ca1ef3f8bea15ab9f4756acc33e851a911df972f58987979f54734383"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "45490bb4ac7da06c07746eaa7f9c243acadd76f42544ff7782591fe6ca09d061"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "0b58f1da55d8da175ceec54196fa28eb32d3b97bb498d62e0048af58348137f9"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %W[
      -X github.com/isometry/wavefront-controller/internal/wfctl/cli.Version=v#{version}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/wfctl"
    generate_completions_from_executable(bin/"wfctl", "completion")
    bin.install_symlink "wfctl" => "kubectl-wavefront"
  end

  test do
    system bin/"wfctl", "--version"
  end
end
