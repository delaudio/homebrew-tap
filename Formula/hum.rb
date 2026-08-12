class Hum < Formula
  desc "Product-neutral local development orchestrator and terminal monitor"
  homepage "https://github.com/delaudio/hum"
  version "0.3.0"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/hum/releases/download/v0.3.0/hum-#{version}-macos-arm64.tar.gz"
      sha256 "eee8bd01553e5989ac117a77e490515a5f1d3c7402b0d43b054011a01367d120"
    else
      url "https://github.com/delaudio/hum/releases/download/v0.3.0/hum-#{version}-macos-x86_64.tar.gz"
      sha256 "6d10f6662ccd829b4488422d03be63c04eb92c93819f4e51550443d3cc2c18eb"
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
