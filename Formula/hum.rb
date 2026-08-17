class Hum < Formula
  desc "Product-neutral local development orchestrator and terminal monitor"
  homepage "https://github.com/delaudio/hum"
  version "0.6.1"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/hum/releases/download/v0.6.1/hum-#{version}-macos-arm64.tar.gz"
      sha256 "c704094ab4b51b983e5818c75d84068ec6437014a3a53e7a338c3cade26a3601"
    else
      url "https://github.com/delaudio/hum/releases/download/v0.6.1/hum-#{version}-macos-x86_64.tar.gz"
      sha256 "1dfccf69bc3188670707da52d4e9ebe9fcb85af3cf7ff220444b5f7dac495b91"
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
