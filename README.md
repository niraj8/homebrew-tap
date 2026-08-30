# homebrew-tap

Personal Homebrew tap.

```sh
brew install niraj8/tap/mailprune
brew install niraj8/tap/file-tinder
```

## Releasing a new version of a formula

1. In the tool's repo: bump the version (`Cargo.toml`, `package.json`, whichever the tool uses), commit, `git tag vX.Y.Z`, push the tag, `gh release create vX.Y.Z --generate-notes`.
2. `curl -sL https://github.com/niraj8/<tool>/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256`
3. Update `url` and `sha256` in `Formula/<tool>.rb`, commit, push.
4. `brew update && brew upgrade <tool>` to verify.
