class Gobottle < Formula
  desc "Build and publish Homebrew bottles for Go projects"
  homepage "https://github.com/isometry/gobottle"
  url "https://github.com/isometry/gobottle/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "fc1f123e901683d20bb874d2454aedf39eeee3e2ae0b09f113d2d8163f602809"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/isometry/tap"
    sha256 cellar: :any_skip_relocation, monterey: "e013c1fd53524f751c5b9ad36f8740678285948d840a6ca77e0ebad9c8e53644"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "a3d996982ddfe57bcc4da24afb8af097e6c158316a59f999226d64ef677bc1fc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "331352d70141edad2e87c41489cb2d5c8a8dd1aa864f159c164db4b564798052"
    sha256 cellar: :any_skip_relocation, aarch64_linux: "7fc770ceae8ec65ae58d120b3132343d2b051a6552f544185a0d71297c747faf"
  end

  def install
    bin.install "gobottle"
    generate_completions_from_executable(bin/"gobottle", "completion")
  end

  test do
    system bin/"gobottle", "version"
  end
end
