class Wfctl < Formula
  desc "Inspect and operate a Wavefront progressive-delivery fleet"
  homepage "https://github.com/isometry/wavefront-controller"
  url "https://github.com/isometry/wavefront-controller/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "711a671cda43628e8522887ab6e4deb34e25e21946ba51dee7cfdb2783259ac2"
  license "Apache-2.0"
  head "https://github.com/isometry/wavefront-controller.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "1c251655d21692071fe487b5ac42621689103ea0fdc3a98ba2441be47c4d75f0"
    sha256 cellar: :any_skip_relocation, monterey:       "130af815dbeb75651395d3b028cbec3cdc328f180d29b5c131f27fa5800c0296"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "86eedb32514c2a659b56de9df9cc1ece99962e4eaae528725e8f2eb4a82cf19a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f49d4a6225e4b87cde85a51e5cbc3dcd6cfe2a3776aa2ff240a2cd2f3fae33e4"
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
