class Ghup < Formula
  desc "A GitHub API client for managing tags and repository content from third-party automation systems"
  homepage "https://just.breathe.io/project/ghup/"
  url "https://github.com/nexthink-oss/ghup/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "cb112a0ac8c42d30183b11a3db16c621c05d4f4d558b36761cd512d6420cc532"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, monterey: "7f9da95d656ec34104b740cee5c45bbc6822b520b4ba7797a809670ff73ece07"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "029e0ddb14cc01f05a3a9c4fbfd4f80059a0635e5af98ef971ec0b3796e5d019"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d24d26e255d9d0a3f4f7ae78484914447737dc00e6a6588cfdb7320e3c4736cc"
    sha256 cellar: :any_skip_relocation, aarch64_linux: "f1bd2ec347d75d74a54b3de0095c5e7c59bfa122bc6c08faefe1c9edfe3a1085"
  end

  def install
    bin.install "ghup"
    generate_completions_from_executable(bin/"ghup", "completion")
  end

  test do
    system "#{bin}/ghup --help"
  end
end
