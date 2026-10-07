class GiteaMirror < Formula
  desc "Manage Gitea mirror lifecycle"
  homepage "https://just.breathe.io/project/gitea-mirror/"
  url "https://github.com/nexthink-oss/gitea-mirror/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "f28c205f83da116a5f044a9321b20410063dabde697aa6b503e08b5a562644f3"
  license "BSD-3-Clause"
  head "https://github.com/nexthink-oss/gitea-mirror.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/nexthink-oss/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "89c01e1d2e0dedc248f4c6c0a62a88c832d0bca0f92352f4e7d0d53c69152bb5"
    sha256 cellar: :any_skip_relocation, monterey:       "edc8da47e093c2859e9db4634e221f5f61daa276ca0bcc4bc7793d337842d235"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "cf1c9e4a5a53206b13513b0a9b435a35cfcbd61bd4a029953b7fe157ebe00c86"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "924763c27161861bbe4a72d61b9ffc11cb0d30d4aefe9168be4498a500bf77c0"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    commit = build.head? ? Utils.git_head(buildpath, safe: false) : "b1596b798fac25b8866c1f437aaff22263848c4b"
    ldflags = %W[
      -X main.version=#{version}
      -X main.commit=#{commit[0,7]}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "."
    generate_completions_from_executable(bin/"gitea-mirror", "completion")
  end

  test do
    system "#{bin}/gitea-mirror --help"
  end
end
