# Everloud Homebrew tap

```bash
brew install everloud/tap/revid                 # the command-line tool
brew install --cask everloud/tap/revid-tagger   # the tagger app
```

| | What | From |
|---|---|---|
| `Formula/revid.rb` | `revid` and `revid-agent`, which it runs | `https://download.everloud.ai/revid/cli/` |
| `Casks/revid-tagger.rb` | The revid tagger app | `https://download.everloud.ai/revid/tagger/` |

Builds are for macOS on Apple Silicon, signed with a Developer ID and notarized by Apple. The files stay on download.everloud.ai: this repository holds only the recipes that point at them, with their checksums.

## How it is updated

The release jobs of the repository that makes each program update its recipe here: they write the new `version` and `sha256` and push to `main` with a deploy key. Do not change those two lines by hand unless a release job failed to.

`brew livecheck everloud/tap/revid` (or `--cask everloud/tap/revid-tagger`) compares a recipe with the latest version published, from `latest.txt` next to the files.

## Checks

Every push and pull request runs `brew style`, `brew audit --strict --online`, installs both and runs the formula's test (`.github/workflows/check.yml`).
