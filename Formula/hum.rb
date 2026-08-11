class Hum < Formula
  desc "Product-neutral local development orchestrator and terminal monitor"
  homepage "https://github.com/delaudio/hum"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/hum/releases/download/v0.1.0/hum-#{version}-macos-arm64.tar.gz"
      sha256 "d53dadfd345723fee3f7de9ed323a416a5d0bfa7554a100401313bb73304ff6b"
    else
      url "https://github.com/delaudio/hum/releases/download/v0.1.0/hum-#{version}-macos-x86_64.tar.gz"
      sha256 "038b889320075e0d2430e320e4a7e82d269b2a469ba07de244eef3081a12c532"
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
