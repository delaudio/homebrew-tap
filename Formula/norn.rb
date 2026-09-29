class Norn < Formula
  desc "Local-first review tooling from command line"
  homepage "https://github.com/delaudio/norn"
  version "0.3.2"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-arm64.tar.gz"
      sha256 "55e6c22e3f2539f356bff105d35f103313dcd28b5b45f707095a0dff4528aa81"
    else
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-x86_64.tar.gz"
      sha256 "cdcf345ba151a665f3751396680ef2124790176a1d4d5c470dfd74af90f22736"
    end
  end

  def install
    bin.install "norn"
    bin.install "norn-tui"
    pkgshare.install "share/norn/agent-skills"
    pkgshare.install "share/norn/browser-diff"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/norn --version")
    assert_match "norn", shell_output("#{bin}/norn --help")
    assert_predicate pkgshare/"agent-skills/norn-review/SKILL.md", :exist?
    assert_predicate pkgshare/"browser-diff/browser-diff.html", :exist?
    assert_match "norn.skills.v1", shell_output("#{bin}/norn skills status --json")
  end
end
