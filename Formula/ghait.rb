class Ghait < Formula
  desc "Easily generate GitHub App Installation Tokens"
  homepage "https://just.breathe.io/project/ghait/"
  url "https://github.com/isometry/ghait/archive/refs/tags/v91.0.0.tar.gz"
  sha256 "aa1dd6034380f7577b3c8ad4eb455e6fcce06521a07656519953e83be79a7af3"
  license "Apache-2.0"
  head "https://github.com/isometry/ghait.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "425dccf2f155ddc5ea2a7b50520902540f4abac3ed21a0d18f6c06a16889472a"
    sha256 cellar: :any_skip_relocation, monterey:       "949ae486b4b9d0c7765d65ad85747578cfd1b0d40864b6c253a2dc4b204acf29"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "6e37e23aee337141438b0bc45e68c3c8870e288a602795cf72ab95e96bd49f19"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "9ef0a755328813d3e3f6d7a5c8efcee21ed846af20d99b0cf39dcebfee2737be"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    commit = build.head? ? Utils.git_head(buildpath, safe: false) : "af8da0aeecb674dcd4bebf1afff19430d87e37f1"
    ldflags = %W[
      -X main.version=#{version}
      -X main.commit=#{commit}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/ghait"
    generate_completions_from_executable(bin/"ghait", "completion")
  end

  test do
    system bin/"ghait", "--version"
  end
end
