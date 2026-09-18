# Contributing

Thanks for helping improve the Codex CLI add-on. Bug reports, documentation fixes, and focused pull requests are welcome.

## Before opening an issue

Check existing issues and the [support guide](SUPPORT.md). For security vulnerabilities, use the private reporting path in [SECURITY.md](SECURITY.md). Do not post credentials, SSH keys, Codex login data, Home Assistant secrets, or unredacted logs.

## Pull requests

1. Describe the problem and the proposed change. Keep unrelated changes in separate pull requests.
2. Update the README or add-on documentation when installation, configuration, or behavior changes.
3. Run `sh -n codex_cli/run.sh` for shell changes and `docker build -t codex-cli-addon ./codex_cli` for image changes when Docker is available. GitHub Actions builds both supported architectures.
4. For behavior that depends on Home Assistant, describe the add-on version, architecture, and the install or upgrade steps you tested. Never include private configuration or authentication files in test evidence.
5. Keep the Codex CLI version pinned in the Dockerfile and bump the add-on version in `codex_cli/config.yaml` when changing the packaged add-on.

By participating, you agree to follow the [code of conduct](CODE_OF_CONDUCT.md). Contributions are released under this repository's [MIT license](LICENSE).
