class Gobottle < Formula
  desc "Build and publish Homebrew bottles for Go projects"
  homepage "https://github.com/isometry/gobottle"
  url "https://github.com/isometry/gobottle/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "09f2c35394b927e9b590da3e5f308db5c444ebe04138b2a903faa7946956b761"
  license "MIT"
  head "https://github.com/isometry/gobottle.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "454eadefe1b1680a0e38a861e7564fd7d5383683cb62bed538547a88859a7450"
    sha256 cellar: :any_skip_relocation, monterey:       "8a0b9ae47884de44986ccbc848019382daebfe28d8698fc21398385ee21eafb4"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "812d4ec302323cc95158f75b29487cc0763763028eb77c6a4da8fd0756ab5d3c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "3aedd19dc2460768c37e718ce35a20c9a95ed17ea1f0cbb2c7d1305766359776"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    commit = build.head? ? Utils.git_head(buildpath, safe: false) : "595991a8d35cba3489e3c5d932f3d2b7159bb41f"
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
