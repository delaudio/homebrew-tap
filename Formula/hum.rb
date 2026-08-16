class Hum < Formula
  desc "Product-neutral local development orchestrator and terminal monitor"
  homepage "https://github.com/delaudio/hum"
  version "0.5.0"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/hum/releases/download/v0.5.0/hum-#{version}-macos-arm64.tar.gz"
      sha256 "f2635f91cdf926c713b68f3bb56ddd4bf2eed00885085d896d818fa375528f55"
    else
      url "https://github.com/delaudio/hum/releases/download/v0.5.0/hum-#{version}-macos-x86_64.tar.gz"
      sha256 "2327d311c36a98e6a6ec204cb6130567362e9426627e6db846b3c90df78a51df"
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
