#!/bin/sh
set -eu

KEY_FILE=/config/authorized_keys
HOME_DIR=/data/home
SSH_DIR=/data/ssh

if [ ! -s "$KEY_FILE" ]; then
  echo "Add a public key to the add-on configuration file: authorized_keys" >&2
  exit 1
fi

mkdir -p "$HOME_DIR/.ssh" "$HOME_DIR/.codex" "$SSH_DIR" /run/sshd
if [ ! -e "$SSH_DIR/ssh_host_ed25519_key" ]; then
  ssh-keygen -q -t ed25519 -N '' -f "$SSH_DIR/ssh_host_ed25519_key"
fi

cp "$KEY_FILE" "$HOME_DIR/.ssh/authorized_keys"
chown -R codex:root "$HOME_DIR"
chmod 0700 "$HOME_DIR" "$HOME_DIR/.ssh" "$HOME_DIR/.codex"
chmod 0600 "$HOME_DIR/.ssh/authorized_keys" "$SSH_DIR/ssh_host_ed25519_key"
chmod 0644 "$SSH_DIR/ssh_host_ed25519_key.pub"

/usr/sbin/sshd -t
exec /usr/sbin/sshd -D -e
