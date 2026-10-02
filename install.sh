#!/usr/bin/env bash
# Install donnell_nvim_config without replacing an existing configuration.
set -euo pipefail

config_dir="${HOME}/.config"
clone_dir="${config_dir}/donnell_nvim_config"
nvim_dir="${config_dir}/nvim"
repo_url="https://github.com/donnell-f/donnell_nvim_config.git"

if ! command -v git >/dev/null 2>&1; then
  printf 'Error: Git must be installed before running this script.\n' >&2
  exit 1
fi

# Include symbolic links in these checks, even if their targets are missing.
for path in "$clone_dir" "$nvim_dir"; do
  if [[ -e "$path" || -L "$path" ]]; then
    printf 'Error: %s already exists. Move it aside before installing.\n' "$path" >&2
    exit 1
  fi
done

mkdir -p "$config_dir"
git clone --branch main --single-branch "$repo_url" "$clone_dir"
mv "$clone_dir" "$nvim_dir"

printf 'Neovim configuration installed at %s\n' "$nvim_dir"

