class Choam < Formula
  desc "Track updates for melange build specification files"
  homepage "https://just.breathe.io/project/choam/"
  url "https://github.com/isometry/choam/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "04e048c6330ea154e5931b41b3fdd8d03857a06eb0f319d72aafc1d466ad2338"
  license "MIT"
  head "https://github.com/isometry/choam.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "6698b0eaa82884f43ce8a905112049374015c47918516d86dd62a12557c02952"
    sha256 cellar: :any_skip_relocation, monterey:       "8dc56392e36b4f6d401e98aea8533a7252c28404a8a179ffd7656f6554cc8564"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "030d470a11c20704362064910128576cec830a9b9b3ef69c7dc1f30ec2e83d16"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "0b75cbfd5c0a50836d4fb4885884775ceb901bb768b485135f001bd32afe77bf"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(), "."
    generate_completions_from_executable(bin/"choam", "completion")
  end

  test do
    system bin/"choam", "--help"
  end
end
