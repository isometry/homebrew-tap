class Ghup < Formula
  desc "A GitHub API client for managing tags and repository content from third-party automation systems"
  homepage "https://just.breathe.io/project/ghup/"
  url "https://github.com/nexthink-oss/ghup/archive/refs/tags/v0.20.0.tar.gz"
  sha256 "8bf87f36841848e34c6a15873946970256641f7723709948101876ed7e89ffe1"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, monterey: "5c44e86ca9d2e5fbd99a7053cd3a69865b151762e1592a5780a5a698ec7431f1"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "411ef7fba48bcfb9aea5fd294c1f1c8064ee6cef5fc42c6df989b38b4876f829"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cbfc0e184f85a5b835a9833a78a56a755053c5dddb5c4ddd1ef32bd8b4fe48a4"
    sha256 cellar: :any_skip_relocation, aarch64_linux: "c122c75f62e2514aa597ae113cfcda8b2525dfa1ed687b370ed1a24729547027"
  end

  def install
    bin.install "ghup"
    generate_completions_from_executable(bin/"ghup", "completion")
  end

  test do
    system "#{bin}/ghup --help"
  end
end
