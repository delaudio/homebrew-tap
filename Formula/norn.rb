class Norn < Formula
  desc "Local-first review tooling from command line"
  homepage "https://github.com/delaudio/norn"
  version "0.3.4"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-arm64.tar.gz"
      sha256 "a09cef5d7a5aedbe0cae75babfda6ae1bb5e82fd49fcf759540c427021d96de2"
    else
      url "https://github.com/delaudio/norn/releases/download/v#{version}/norn-#{version}-macos-x86_64.tar.gz"
      sha256 "77915da183b086d7e805d2b4f39741f5adc717e3ae40e0ce7b134c5f39f52f51"
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
