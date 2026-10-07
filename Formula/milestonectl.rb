class Milestonectl < Formula
  desc "Inspect Milestone and ClusterMilestone readiness gates"
  homepage "https://github.com/isometry/milestone-operator"
  url "https://github.com/isometry/milestone-operator/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "7b13026551ca2a839d002386f20ded3a988011b377309fca7dac7fde0a57b961"
  license "Apache-2.0"
  head "https://github.com/isometry/milestone-operator.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "4550151c83d986fc5bb7e4910a3df1423d91836cef663c53306289409867b5dc"
    sha256 cellar: :any_skip_relocation, monterey:       "5fa92ec009619f937f970073694ff942b834f63771dbbe4081bef90d51eb188d"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "cb0aafbd8b812801e497c5826d426e8795d6391fb751087ec181e58371f14683"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "aaab4bad22f5c40e43f25ec5a6a1472d689359a8b4381859207b13a745153c77"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    commit = build.head? ? Utils.git_head(buildpath, safe: false) : "658c401a2cb63005739f37854f3c09fd9e03291e"
    ldflags = %W[
      -X github.com/isometry/milestone-operator/internal/version.Version=v#{version}
      -X github.com/isometry/milestone-operator/internal/version.Commit=#{commit}
      -X github.com/isometry/milestone-operator/internal/version.Date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/milestonectl"
    bin.install_symlink "milestonectl" => "kubectl-milestone"
    bin.install_symlink "milestonectl" => "kubectl_complete-milestone"
    generate_completions_from_executable(bin/"milestonectl", "completion")
  end

  test do
    system bin/"milestonectl", "version", "--client"
  end
end
