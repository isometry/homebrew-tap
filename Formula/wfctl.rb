class Wfctl < Formula
  desc "Inspect and operate a Wavefront progressive-delivery fleet"
  homepage "https://github.com/isometry/wavefront-controller"
  url "https://github.com/isometry/wavefront-controller/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "435463a0159ad547c364e4502317f1c1c5f517300d0f18ef5de98ef6dabaacdc"
  license "Apache-2.0"
  head "https://github.com/isometry/wavefront-controller.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "cd27d26feed163d651a338ea6f1db74f6d8ce1464349d2386a7efbbcf4840b9e"
    sha256 cellar: :any_skip_relocation, monterey:       "b46158d339b286f91cde39ff54ad344f0645aa3d3a3ed1a7bc79b0255574b9e8"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "f5659a788915d4ea0a3a6b1a68182bd0c359d40f936f1e4010e60be4e631b15e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "731e19e8358dc446e54f51e4ea0952f06779ebe8eb69c1aaad8a90f7a1a2d08f"
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
