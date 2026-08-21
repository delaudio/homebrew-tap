class Hum < Formula
  desc "Product-neutral local development orchestrator and terminal monitor"
  homepage "https://github.com/delaudio/hum"
  version "0.6.3"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/hum/releases/download/v0.6.3/hum-#{version}-macos-arm64.tar.gz"
      sha256 "d7bad14511571f8bfde2441e6d38de0bc82e2ff017ddfddd2c14b442ab02b616"
    else
      url "https://github.com/delaudio/hum/releases/download/v0.6.3/hum-#{version}-macos-x86_64.tar.gz"
      sha256 "fd9df03463f373a836daeb642b01e838d8336e8ef0e763c5d6bb8574c5c9a4c9"
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
