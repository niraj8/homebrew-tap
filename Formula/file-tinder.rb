class FileTinder < Formula
  desc "Swipe through loose files and decide, one keypress at a time, what to trash"
  homepage "https://github.com/niraj8/file-tinder"
  url "https://github.com/niraj8/file-tinder/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "18b6b7960f9b64fffd2bd925dec536b67848a6db4149b7a60a263ab3a96574ec"
  license "MIT"
  head "https://github.com/niraj8/file-tinder.git", branch: "main"

  depends_on "bun"
  depends_on :macos

  def install
    # No runtime dependencies, so there is nothing to `bun install` here: bun runs the
    # TypeScript straight from libexec. public/index.html is inlined by the import in
    # src/server.ts, but bun resolves that import at run time, so it has to ship too.
    libexec.install "index.ts", "src", "public", "package.json", "tsconfig.json"
    (bin/"file-tinder").write <<~SH
      #!/bin/bash
      exec "#{formula_opt_bin("bun")}/bun" "#{libexec}/index.ts" "$@"
    SH
  end

  test do
    assert_match "swipe through the loose files", shell_output("#{bin}/file-tinder --help")
    assert_match "is not a folder", shell_output("#{bin}/file-tinder #{testpath}/nope 2>&1", 1)
  end
end
