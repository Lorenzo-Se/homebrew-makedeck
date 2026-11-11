# Homebrew tap for makedeck

```sh
brew install lorenzo-se/makedeck/makedeck
```

See [makedeck](https://github.com/Lorenzo-Se/makedeck).

## Releasing a new version

1. Tag the release in the makedeck repository and push the tag, e.g. `v1.0.1`.
2. In `Formula/makedeck.rb`, set `url` to the new tag and `sha256` to the output of:

   ```sh
   curl -sL https://github.com/Lorenzo-Se/makedeck/archive/refs/tags/v1.0.1.tar.gz | shasum -a 256
   ```

3. Check it: `brew install --build-from-source lorenzo-se/makedeck/makedeck && brew test makedeck && brew audit --strict makedeck`
