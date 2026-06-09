class Mailprune < Formula
  desc "Email triage TUI - stack inbox by sender, bulk trash/archive/unsubscribe"
  homepage "https://github.com/niraj8/mailprune"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/niraj8/mailprune/releases/download/v0.1.1/mailprune-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "e5f134f0803b9abcc212a251add6dcde34f636ddd57d00dee225ac5803eaf319"
    else
      url "https://github.com/niraj8/mailprune/releases/download/v0.1.1/mailprune-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "6349dbd8ac152c5ab04782b04bf59842c11e52b3704e0a68a9248f035d75e5eb"
    end
  end

  on_linux do
    url "https://github.com/niraj8/mailprune/releases/download/v0.1.1/mailprune-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f4bcf2deff60bafcd1fbb2ddd4389d388fc24342ecd32de4614233bd5303ebf8"
  end

  def install
    bin.install "mailprune"
  end

  test do
    assert_match "mailprune", shell_output("#{bin}/mailprune --help")
  end
end
