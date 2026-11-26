# The command-line tool, built, signed and notarized by the release of
# everloud/revid. Its release job updates `version` and `sha256` here.
class Revid < Formula
  desc "Say how a video was made: shots, transitions, on-screen text and sound"
  homepage "https://download.everloud.ai/revid/install.sh"
  url "https://download.everloud.ai/revid/cli/0.2.0/revid-0.2.0-aarch64-apple-darwin.tar.gz"
  sha256 "0e61b35d2d9df9e6e33c1c4b1135b7f2a321b511d9439bb5e61118d2416aaa02"
  license :cannot_represent

  livecheck do
    url "https://download.everloud.ai/revid/cli/latest.txt"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on arch: :arm64
  depends_on :macos
  # revid takes ffmpeg and ffprobe from PATH when it finds them, instead of
  # downloading a static build on first use.
  depends_on "ffmpeg"

  def install
    # revid runs revid-agent from its own folder.
    bin.install "revid", "revid-agent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/revid --version")
    system bin/"revid-agent", "catalog"
  end
end
