class Choam < Formula
  desc "Track updates for melange build specification files"
  homepage "https://just.breathe.io/project/choam/"
  url "https://github.com/isometry/choam/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "1898f8e9d7c6ccdd793ff3edce125c71c6764e0ba0ca3b6a35a3c1965e703c44"
  license "MIT"
  head "https://github.com/isometry/choam.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "e7698dafcd07f60fe78a2b2758de22d87aa5b9546124302ab65eecaf45a6ddd9"
    sha256 cellar: :any_skip_relocation, monterey:       "b7e35558937f58455bfd374adfb96dc7bac0c20a064338a50c98486f7d85842f"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "8da6daf9cf51451206c4ce8cac2cc323472c3837ebd495e49f3eefcdefa69852"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "1587d91c3c54489fea2843df1396fd7836ee0612c5fa466be404b0eb4c7ce26b"
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
