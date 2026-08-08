class Mailprune < Formula
  desc "Email triage TUI - stack inbox by sender, bulk trash/archive/unsubscribe"
  homepage "https://github.com/niraj8/mailprune"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/niraj8/mailprune/releases/download/v0.2.0/mailprune-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "ec0455eac57767645454cdde3cd96a41f9b2f6fe13652be445f39c43f955cc1b"
    else
      url "https://github.com/niraj8/mailprune/releases/download/v0.2.0/mailprune-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "a246dcc6fc2dd159597dd2609d450a2f81cd7539a1f033525da0d496c8ccf79a"
    end
  end

  on_linux do
    url "https://github.com/niraj8/mailprune/releases/download/v0.2.0/mailprune-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "846c998b9996d9143b7050322698bb66bb3962822e14b22390456d24027fe863"
  end

  def install
    bin.install "mailprune"
  end

  test do
    assert_match "mailprune", shell_output("#{bin}/mailprune --help")
  end
end
