# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ghup < Formula
  desc "A GitHub API client for managing tags and repository content from third-party automation systems"
  homepage "https://just.breathe.io/project/ghup/"
  version "0.11.3"

  on_macos do
    on_intel do
      url "https://github.com/nexthink-oss/ghup/releases/download/v0.11.3/ghup_0.11.3_darwin_amd64.zip"
      sha256 "dc6cfcfb26ebcaa857278bbdfcaa12f6f224abd25ffefd7f6bdf073640af0bd2"

      def install
        bin.install "ghup"
      end
    end
    on_arm do
      url "https://github.com/nexthink-oss/ghup/releases/download/v0.11.3/ghup_0.11.3_darwin_arm64.zip"
      sha256 "2e16e99002421d0ce5e4a71646bc76b806d35aed34bca7405685529be2b91ce8"

      def install
        bin.install "ghup"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.11.3/ghup_0.11.3_linux_amd64.zip"
        sha256 "a4c86e3a5591bee00da01ee5265022f038cf138b509ebba10e7dbc1d4f576a91"

        def install
          bin.install "ghup"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.11.3/ghup_0.11.3_linux_arm.zip"
        sha256 "7edabbdb86a3c9150fd6df88fd613f8cb70c2dc9705fa0b10a6c1808bad66519"

        def install
          bin.install "ghup"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/nexthink-oss/ghup/releases/download/v0.11.3/ghup_0.11.3_linux_arm64.zip"
        sha256 "994b664a04d18787fc0bc22d5e87d969a7f277c14f54a5a8cdc2a75ba2a03eba"

        def install
          bin.install "ghup"
        end
      end
    end
  end

  test do
    system "#{bin}/ghup --help"
  end
end
