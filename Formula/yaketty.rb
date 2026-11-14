class Yaketty < Formula
  desc "Orchestrated conversations between AI personas using Ollama"
  homepage "https://just.breathe.io/project/yaketty/"
  url "https://github.com/isometry/yaketty/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "79896a058647c03c392c09b21d78300e813439ad70273155aad008a85c75356d"
  license "MIT"
  head "https://github.com/isometry/yaketty.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "80540109a62495da87c934ae3d16cc3c8cd9ed98d2cc4594396b151eababf4b3"
    sha256 cellar: :any_skip_relocation, monterey:       "93769e9beb66428e81143be650400348914198aa6b77e498a358d0866a9a9b9c"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "b33e5d3a2e60153f08cf0a3400c7fa7cabf1e20ea6bd3cc14d3327603d85333e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "51304e22203fd66475546e5179192feaee1e05582d0b2f8b99e547727c91c644"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    commit = build.head? ? Utils.git_head(buildpath, safe: false) : "77716d32d7678edd715d9d6f23b0d85f83b3d00e"
    ldflags = %W[
      -X main.version=#{version}
      -X main.commit=#{commit[0,7]}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "."
    generate_completions_from_executable(bin/"yaketty", "completion")
  end

  test do
    system bin/"yaketty", "--version"
  end
end
