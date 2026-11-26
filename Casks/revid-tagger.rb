# The tagger app, with its own revid inside, built, signed and notarized by
# the release of everloud/revid. Its release job updates `version` and
# `sha256` here.
cask "revid-tagger" do
  version "0.2.0"
  sha256 "50436636f8cbac7ad166d77cbf10bde523e7e05c2d07edbcb58f24409ec84639"

  url "https://download.everloud.ai/revid/tagger/#{version}/revid-tagger-#{version}-aarch64.dmg"
  name "revid tagger"
  desc "Try configurations of revid on the videos of a dataset"
  homepage "https://download.everloud.ai/revid/tagger/latest.json"

  livecheck do
    url "https://download.everloud.ai/revid/tagger/latest.txt"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on arch: :arm64

  app "revid tagger.app"

  zap trash: [
    "~/Library/Application Support/dev.revid.tagger",
    "~/Library/Caches/dev.revid.tagger",
    "~/Library/Preferences/dev.revid.tagger.plist",
    "~/Library/Saved Application State/dev.revid.tagger.savedState",
    "~/Library/WebKit/dev.revid.tagger",
  ]
end
