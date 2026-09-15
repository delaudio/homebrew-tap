class Norn < Formula
  desc "Local-first review tooling from command line"
  homepage "https://github.com/delaudio/norn"
  version "0.3.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-arm64.tar.gz"
    sha256 "b2e769a4f1f633382643036635ddcf867fdda20c07032436735372c19222d007"
  else
    url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-x86_64.tar.gz"
    sha256 "787981c89cde75af870f1a3a2e0cf1b74e85b98d33787489e1d12e53f71ef4c0"
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
