class Trk < Formula
  desc "Terminal tracker and music composition environment"
  homepage "https://github.com/delaudio/trk"
  version "0.1.0"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/trk/releases/download/v0.1.0/trk-#{version}-macos-arm64.tar.gz"
      sha256 "afab98e506e2213f166e49250d5e6d88e70f284fea75b0cd5459ad9d6b35a2ec"
    else
      url "https://github.com/delaudio/trk/releases/download/v0.1.0/trk-#{version}-macos-x86_64.tar.gz"
      sha256 "eaba712b92b424214f1e34164f946faf4294ceb4a11d597f32509740b6754a43"
    end
  end

  def install
    bin.install "trk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trk --version")
    assert_match "Usage:", shell_output("#{bin}/trk --help")
  end
end
