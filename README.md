# delaudio Homebrew tap

Homebrew formulae for delaudio tools.

## Norn

Install [Norn](https://github.com/delaudio/norn):

```sh
brew tap delaudio/tap
brew install norn
```

Norn currently ships as command-line binaries only (`norn`, `norn-tui`).
There is no Homebrew cask yet — no signed/notarized desktop app is
published, so `brew install --cask norn` will not work.

The CLI binaries themselves are not code-signed or notarized either. macOS
Gatekeeper may block them as coming from an unidentified developer on first
run. If that happens, approve the binary once in **System Settings →
Privacy & Security → Open Anyway**, then rerun the command. Do not strip
the quarantine attribute or signature yourself.

## Hum

Install [Hum](https://github.com/delaudio/hum):

```sh
brew install delaudio/tap/hum
```

## Trk

Install [Trk](https://github.com/delaudio/trk):

```sh
brew install delaudio/tap/trk
```
