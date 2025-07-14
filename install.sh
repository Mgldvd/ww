#!/usr/bin/env bash
# install ww CLI, copy YAML configs to ~/.config/ww (no sub-folders), colored summary

set -euo pipefail

repo="Mgldvd/ww"
branch="master"
bin_dir="/usr/local/bin"
cfg_dir="$HOME/.config/ww"
tmp_dir="$(mktemp -d)"

curl -Ls "https://github.com/${repo}/archive/refs/heads/${branch}.tar.gz" | tar -xz -C "$tmp_dir" --strip-components=1
sudo install -m755 "$tmp_dir/ww" "$bin_dir/ww"

mkdir -p "$cfg_dir"
for f in "$tmp_dir"/*.yml "$tmp_dir"/commands.d/*.yml; do
    [ -e "$f" ] || continue
    dest="$cfg_dir/$(basename "$f")"
    [ -e "$dest" ] || install -m644 "$f" "$dest"
done

rm -rf "$tmp_dir"

printf '\n\033[32m✔ ww CLI installed at \033[36m%s/ww\033[0m\n' "$bin_dir"
printf '↳ YAML configuration files copied to \033[36m%s\033[0m (existing files left untouched)\n' "$cfg_dir"
printf 'Run \033[33mww\033[0m anywhere or add extra *.yml files to that directory.\n'
