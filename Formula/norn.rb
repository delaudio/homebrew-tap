class Norn < Formula
  desc "Local-first review tooling from command line"
  homepage "https://github.com/delaudio/norn"
  version "0.2.4"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-arm64.tar.gz"
      sha256 "1e43a7672b1190b0934f23007f94885b873db40d406efd49986356a2efeefc41"
    else
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-x86_64.tar.gz"
      sha256 "e58971ae52c494e4aa708830c9a1d0d1c18cac167305ac87dbd69cf572059a97"
    end
  end

  def install
    bin.install "norn"
    bin.install "norn-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/norn --version")
    assert_match "norn", shell_output("#{bin}/norn --help")
  end
end
