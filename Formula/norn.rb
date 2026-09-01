class Norn < Formula
  desc "Local-first review tooling from command line"
  homepage "https://github.com/delaudio/norn"
  version "0.2.7"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-arm64.tar.gz"
      sha256 "86123a7db7eae947a4ca7402fcb7b422b679619735f533323b3d60c9fe202f38"
    else
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-x86_64.tar.gz"
      sha256 "5b53fec9feac5f8c972725af58aff6f6c606277fa9fd09ce0477bd2bf5be2cb7"
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
