class Norn < Formula
  desc "Local-first review tooling from command line"
  homepage "https://github.com/delaudio/norn"
  version "0.2.5"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-arm64.tar.gz"
      sha256 "c2084d54c69706dca182fc570babaae5ff3e063c95f378c355dc7971c3a07aad"
    else
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-x86_64.tar.gz"
      sha256 "317e882effe6955a7cbd56929665a86697b80b8a91f3f8993a34d074cd03bfce"
    end
  end

  def install
    bin.install "norn"
    bin.install "norn-tui"
    pkgshare.install "share/norn/agent-skills"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/norn --version")
    assert_match "norn", shell_output("#{bin}/norn --help")
    assert_predicate pkgshare/"agent-skills/norn-review/SKILL.md", :exist?
    assert_match "norn.skills.v1", shell_output("#{bin}/norn skills status --json")
  end
end
