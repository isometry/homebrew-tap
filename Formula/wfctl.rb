class Wfctl < Formula
  desc "Inspect and operate a Wavefront progressive-delivery fleet"
  homepage "https://github.com/isometry/wavefront-controller"
  url "https://github.com/isometry/wavefront-controller/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "4ffa2c76b259b8ba5dcb07ad5399e3477e12d465dcb8f0e7ad27055e4d01bb62"
  license "Apache-2.0"
  head "https://github.com/isometry/wavefront-controller.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "341e33a9494661579904d1005ccc4dbe7883302f671a22f9f4ab15f190726dbd"
    sha256 cellar: :any_skip_relocation, monterey:       "fd9590102e644a9f9e4e740d131ffa574e0e029e8dfaa37ca307051a0668b1cc"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "b775efb04c4fe7ec35d9262cf9d1f97bab0aeaba0eac7c7f2ecb9ee743d79707"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "eecc55140450b7c2b67fdea9fa8f6c62c1e88e059a8c97cc5eb199fbf248ee9f"
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
