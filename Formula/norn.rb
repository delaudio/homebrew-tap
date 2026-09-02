class Norn < Formula
  desc "Local-first review tooling from command line"
  homepage "https://github.com/delaudio/norn"
  version "0.2.8"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-arm64.tar.gz"
      sha256 "59e6495579ace21162e35018e56814fc77607bf5b5164fbcdb31b463983b71bb"
    else
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-x86_64.tar.gz"
      sha256 "1b4d45ce0d88fb3229875c1aa112d1cd3014a0adb80e15ef6aa9fd3a7b625dd7"
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
