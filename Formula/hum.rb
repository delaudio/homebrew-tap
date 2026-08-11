class Hum < Formula
  desc "Product-neutral local development orchestrator and terminal monitor"
  homepage "https://github.com/delaudio/hum"
  version "0.2.1"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/hum/releases/download/v0.2.1/hum-#{version}-macos-arm64.tar.gz"
      sha256 "a15b2cbfa787ebafa19d5499263da24c356b6f6e74dde0842e4d3e0387d92a11"
    else
      url "https://github.com/delaudio/hum/releases/download/v0.2.1/hum-#{version}-macos-x86_64.tar.gz"
      sha256 "f20b8179510985c8ef04fbcba75442812819fad058b357d7b3bf982b0f5f0a27"
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
