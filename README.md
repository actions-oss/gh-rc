# gh-rc
[Runner.Client](https://github.com/ChristopherHX/runner.server) as [GitHub CLI](https://docs.github.com/en/github-cli/github-cli/about-github-cli) extension

## Installation
```
gh extension install https://github.com/actions-oss/gh-rc
```

## Usage

```
gh rc --help
```

## Known Issues

- `osx-arm64` seems to have stability problems due to .net8.0 memory corruptions
- `linux-*` seems to be unable to provide musl binaries as well, static linking not possible
- TODO `GITHUB_TOKEN` secret and `GHES` domain not applied automatically yet
