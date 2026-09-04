class Mailprune < Formula
  desc "Email triage TUI - stack inbox by sender, bulk trash/archive/unsubscribe"
  homepage "https://github.com/niraj8/mailprune"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/niraj8/mailprune/releases/download/v0.2.2/mailprune-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "166937dbe50ac2bfbb223428f3f9bb4b6cf2c4daa263f4e471a584f048efb092"
    else
      url "https://github.com/niraj8/mailprune/releases/download/v0.2.2/mailprune-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "cbe6865c195ab2d17f7271143cd66051983c10e5b4ee9142e5222444946a8fa4"
    end
  end

  on_linux do
    url "https://github.com/niraj8/mailprune/releases/download/v0.2.2/mailprune-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "756e0eb978a24b11978fa2102c1410a796206ae456e86e9d92add7a4a1ccb4fb"
  end

  def install
    bin.install "mailprune"
  end

  test do
    assert_match "mailprune", shell_output("#{bin}/mailprune --help")
  end
end
