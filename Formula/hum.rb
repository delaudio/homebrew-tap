class Hum < Formula
  desc "Product-neutral local development orchestrator and terminal monitor"
  homepage "https://github.com/delaudio/hum"
  version "0.4.1"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/hum/releases/download/v0.4.1/hum-#{version}-macos-arm64.tar.gz"
      sha256 "b78a58836cd90b9234f691812a4030888581bdbc82d001b396194560da4af664"
    else
      url "https://github.com/delaudio/hum/releases/download/v0.4.1/hum-#{version}-macos-x86_64.tar.gz"
      sha256 "217f02c729ae1d8c723de0362d5a4d158211c33893087233323de6c8ecb9a556"
    end
  end

  def install
    bin.install "hum"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hum --version")
    assert_match "Usage:", shell_output("#{bin}/hum --help")
  end
end
