#!/bin/bash
# Exit script on failure
set -ex

# Open config
nvim ~/NixOsConfig

# # Quiet exit on no changes
# if git diff --quiet; then
#     echo "No changes detected, exiting."
#     exit 0
# fi

# Shows changes
git diff -U0

echo "NixOS Rebuilding..."

# Rebuild, output simplified errors, log trackebacks
sudo nixos-rebuild switch --flake ~/NixOsConfig/#$1 &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

# Get current generation metadata
current=$(nixos-rebuild list-generations --json | jq -r '"\(.[0].generation) \(.[0].date) \(.[0].nixosVersion) \(.[0].kernelVersion)"')

# Commit all changes witih the generation metadata
git commit -am "$current"
