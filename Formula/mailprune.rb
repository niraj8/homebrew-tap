class Mailprune < Formula
  desc "Email triage TUI - stack inbox by sender, bulk trash/archive/unsubscribe"
  homepage "https://github.com/niraj8/mailprune"
  url "https://github.com/niraj8/mailprune/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "eafc575419fd8b55b10e122b34f4a76cd3263362fe7e620ad1139cf2fff7604d"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "mailprune", shell_output("#{bin}/mailprune --help")
  end
end
