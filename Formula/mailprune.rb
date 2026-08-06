class Mailprune < Formula
  desc "Email triage TUI - stack inbox by sender, bulk trash/archive/unsubscribe"
  homepage "https://github.com/niraj8/mailprune"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/niraj8/mailprune/releases/download/v0.1.2/mailprune-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "0682050fef1036a53b6f8dac472ed0988733fce3dd19340f5e0c82021775358c"
    else
      url "https://github.com/niraj8/mailprune/releases/download/v0.1.2/mailprune-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "d5ce797b01f526df2c195111b85a5672d2c448a46546e354b235e5e7f19e7459"
    end
  end

  on_linux do
    url "https://github.com/niraj8/mailprune/releases/download/v0.1.2/mailprune-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "afc6d4cf334a1f5d96d019480bb8e60067c7bcecd72efc8112b8d1dad4141e86"
  end

  def install
    bin.install "mailprune"
  end

  test do
    assert_match "mailprune", shell_output("#{bin}/mailprune --help")
  end
end
