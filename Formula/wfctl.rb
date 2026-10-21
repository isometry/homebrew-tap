class Wfctl < Formula
  desc "Inspect and operate a Wavefront progressive-delivery fleet"
  homepage "https://github.com/isometry/wavefront-controller"
  url "https://github.com/isometry/wavefront-controller/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "ea1c19c3f65406145edf8163feeb67be2064976bd2cba7883eb5ab7a6ec8cf25"
  license "Apache-2.0"
  head "https://github.com/isometry/wavefront-controller.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "84ab8b5e2fd2568df6730b805ff1054b3b9d28b99cf1cee20ac12976a034b4cf"
    sha256 cellar: :any_skip_relocation, monterey:       "ce19b98e2753512013b325c8956ae6c54aa73127f750509a41c71e76d8d7796e"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "30b3fcb05f2b121d6c4649df30d4a7f2612497746b1a6863e8b38a40f061aa2f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e02e811cf1522d7c486afd351519f70766a14f4bbb0d52d6af2eafb8c29080c6"
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
