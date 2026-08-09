class Mailprune < Formula
  desc "Email triage TUI - stack inbox by sender, bulk trash/archive/unsubscribe"
  homepage "https://github.com/niraj8/mailprune"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/niraj8/mailprune/releases/download/v0.2.1/mailprune-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "933c5d5af839cee3dbf504917dc0dd12e845d45276efba81523c83793ee35feb"
    else
      url "https://github.com/niraj8/mailprune/releases/download/v0.2.1/mailprune-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "1f01fee97e795215fcfe3c20762c54cbe51d05758713e5118828a463b4178935"
    end
  end

  on_linux do
    url "https://github.com/niraj8/mailprune/releases/download/v0.2.1/mailprune-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b93668de8a21b4bbb32bd5287746ba4c1acf27c50a3b97331de15b6a6c2e5641"
  end

  def install
    bin.install "mailprune"
  end

  test do
    assert_match "mailprune", shell_output("#{bin}/mailprune --help")
  end
end
