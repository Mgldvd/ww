#!/usr/bin/env bash
# install ww CLI from GitHub and place configs in ~/.config/ww

set -euo pipefail

repo="Mgldvd/ww"
branch="main"
bin="/usr/local/bin/ww"
cfg="$HOME/.config/ww"
tmp="$(mktemp -d)"

curl -Ls "https://github.com/${repo}/archive/${branch}.tar.gz" | tar -xz -C "$tmp" --strip-components=1
sudo install -m755 "$tmp/ww" "$bin"
mkdir -p "$cfg"
cp -n "$tmp"/commands.d/*.yml "$cfg"/
rm -rf "$tmp"

printf "\n\e[32m✔ ww CLI installed at %s\e[0m\n" "$bin"
printf "↳ YAML configuration files copied to %s\n" "$cfg"
printf "Run \e[1mww\e[0m anywhere or add extra *.yml files to that directory for custom commands.\n"
