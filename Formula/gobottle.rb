class Gobottle < Formula
  desc "Build and publish Homebrew bottles for Go projects"
  homepage "https://github.com/isometry/gobottle"
  url "https://github.com/isometry/gobottle/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "b12542899114514437825e1b0c8c0d53f3e37070c5d10493ba9fc8a3524d521d"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, monterey: "9f7594b7d59ca40aa1a8591ddac35ed445edff78339a95f442c1f89635e0f448"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5f07e2099807bc8a7531145efcdc4210b24b843357ebff6ba92b92edd49f0f4e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1b1282c6599bd0356072754bfd618d6db5e4b6bcdc60d3dbe40ab22f1fc1bc0c"
    sha256 cellar: :any_skip_relocation, aarch64_linux: "11e3264c68258eff66e1d32c4bf5ea0225f60c6382a13a024e53a95591d54c25"
  end

  def install
    bin.install "gobottle"
    generate_completions_from_executable(bin/"gobottle", "completion")
  end

  test do
    system bin/"gobottle", "version"
  end
end
