class Hum < Formula
  desc "Product-neutral local development orchestrator and terminal monitor"
  homepage "https://github.com/delaudio/hum"
  version "0.6.2"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/hum/releases/download/v0.6.2/hum-#{version}-macos-arm64.tar.gz"
      sha256 "9e0dc01faaa233831d46be9957c62e693a1ae68d63893c0822f93a614a3dc306"
    else
      url "https://github.com/delaudio/hum/releases/download/v0.6.2/hum-#{version}-macos-x86_64.tar.gz"
      sha256 "8c78b8d6fcc0908bec5c530fc44d1e7c0262bfca8611ce10214036e8f2285e44"
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
