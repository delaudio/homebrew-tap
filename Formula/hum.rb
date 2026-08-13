class Hum < Formula
  desc "Product-neutral local development orchestrator and terminal monitor"
  homepage "https://github.com/delaudio/hum"
  version "0.4.0"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/hum/releases/download/v0.4.0/hum-#{version}-macos-arm64.tar.gz"
      sha256 "5a4653ea40e9e50cdce4b5e070ae63fa7c0389208044fea48e0418c6c756e96b"
    else
      url "https://github.com/delaudio/hum/releases/download/v0.4.0/hum-#{version}-macos-x86_64.tar.gz"
      sha256 "c740dcceb48b34a5d7f3e5adc23b4409bbe37c6c66067265229cb7e635badd8e"
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
