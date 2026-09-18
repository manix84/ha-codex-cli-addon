# Codex CLI for Home Assistant

A Home Assistant add-on that runs [OpenAI Codex CLI](https://learn.chatgpt.com/docs/codex/cli) in a dedicated SSH container. It keeps the SSH host key and Codex user's home directory in persistent add-on storage, so login state survives add-on updates.

Maintained by **Rob Taylor**.

## Install

1. In Home Assistant, open **Settings → Add-ons → Add-on Store → Repositories** and add `https://github.com/manix84/ha-codex-cli-addon`.
2. Install **Codex CLI SSH**.
3. Create `authorized_keys` in this add-on's configuration folder, usually `/addon_configs/<repository-id>_codex_cli/`, and put your SSH **public** key in it. The exact folder name appears in Home Assistant's add-on configuration file browser.
4. Start the add-on and use its configured SSH port (default `22223`).
5. Run `ssh -p 22223 codex@<home-assistant-address> 'codex --version'`.
6. Run `ssh -t -p 22223 codex@<home-assistant-address> 'codex login --device-auth'`, finish login in your browser, then verify with `ssh -p 22223 codex@<home-assistant-address> 'codex login status'`.

For the Codex desktop app, add an SSH connection using the `codex` user, your Home Assistant address, and port `22223`. The writable Home Assistant configuration and local add-on folders appear at `/homeassistant` and `/addons`.

See [add-on documentation](codex_cli/DOCS.md) for security, update, and backup notes.

## Community

- [Contributing](CONTRIBUTING.md)
- [Code of conduct](CODE_OF_CONDUCT.md)
- [Security policy](SECURITY.md)
- [Support](SUPPORT.md)

## Development

The add-on is built on Home Assistant when installed from this repository. Codex and its version are pinned in the [Dockerfile](codex_cli/Dockerfile). The build supports `amd64` and `aarch64`.

To test a change locally, run `docker build -t codex-cli-addon ./codex_cli` on a machine with Docker. The add-on has also been installed and authenticated on an `aarch64` Home Assistant system with Codex CLI 0.154.0.
