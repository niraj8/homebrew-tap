class FileTinder < Formula
  desc "Swipe through loose files and decide, one keypress at a time, what to trash"
  homepage "https://github.com/niraj8/file-tinder"
  url "https://github.com/niraj8/file-tinder/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e706c58e9e00f026d3c616a3001ca869907159d79774d965adcd62df1c5c0e92"
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
