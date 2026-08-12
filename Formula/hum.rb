class Hum < Formula
  desc "Product-neutral local development orchestrator and terminal monitor"
  homepage "https://github.com/delaudio/hum"
  version "0.3.1"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/hum/releases/download/v0.3.1/hum-#{version}-macos-arm64.tar.gz"
      sha256 "2f388031c25cfd4f91079ef9f09157d980e50bd07d262ca064e86fab470d4659"
    else
      url "https://github.com/delaudio/hum/releases/download/v0.3.1/hum-#{version}-macos-x86_64.tar.gz"
      sha256 "8041fda89e9c1db28d88a673d6e6203e4763a04192ad4299e422361d7f244fbd"
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
