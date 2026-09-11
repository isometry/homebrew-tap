class Gobottle < Formula
  desc "Build and publish Homebrew bottles for Go projects"
  homepage "https://github.com/isometry/gobottle"
  url "https://github.com/isometry/gobottle/archive/refs/tags/v0.8.3.tar.gz"
  sha256 "e171cc93b69b9bb810c2294917284ecb4fc8b8ae708e1195124511251857edcc"
  license "MIT"
  head "https://github.com/isometry/gobottle.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "6a5ebf7787f471827898957efd510e7268d09b0ab9cce3af2dbf3a8eb2f85eac"
    sha256 cellar: :any_skip_relocation, monterey:       "5423b6cb579b7439445f78b1c20c435c64e57c3ccf966dc3889c45029cdc7cbc"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "9e0fb8e800f7597e983dde4c0f0e2e8138b34032cb0d041f822837ad31aff4e7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "d38e46091bcf705136a7b6ed925cbf17da3ada80c8d58ac58851dec2784d8115"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    commit = build.head? ? Utils.git_head(buildpath, safe: false) : "12bc4c9a04232aa26c6298eada76c2ee21aed846"
    ldflags = %W[
      -X github.com/isometry/gobottle/cmd.Version=#{version}
      -X github.com/isometry/gobottle/cmd.Commit=#{commit}
      -X github.com/isometry/gobottle/cmd.Date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "."
    generate_completions_from_executable(bin/"gobottle", "completion")
  end

  test do
    system bin/"gobottle", "version"
  end
end
