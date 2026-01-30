#!/usr/bin/env sh

set -e

if [ "$(id -u)" -eq 0 ]; then
  echo "󰅙 Error: Do not run this script with sudo. It will prompt for your password." >&2
  exit 1
fi

CURRENT_USER="$(whoami)"
CURRENT_HOME="$(eval echo "~$CURRENT_USER")"
CONFIG_DIR="${XDG_CONFIG_HOME:-$CURRENT_HOME/.config}/stem-init"

echo "󰐗 Installing stem-init"
echo

if [ -d "$CONFIG_DIR" ]; then
  printf "  Templates already exist at $CONFIG_DIR. Override? [y/N] "
  read -r answer
  case "$answer" in
    [yY]|[yY][eE][sS]) ;;
    *)
      echo "󰅙 Installation cancelled."
      exit 1
      ;;
  esac
fi

echo "  Authenticating with sudo..."
sudo -v || exit 1

echo "  Copying templates to $CONFIG_DIR"
mkdir -p "$CONFIG_DIR"
cp -r stem/* "$CONFIG_DIR"

echo "  Installing stem-init to /usr/bin/stem-init"
sudo cp stem-init /usr/bin/stem-init
sudo chmod +x /usr/bin/stem-init

echo
echo "󰄬 stem-init installed successfully"
echo
echo "__________________________________"
echo
stem-init --help
