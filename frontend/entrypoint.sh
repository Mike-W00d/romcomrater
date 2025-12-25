#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -eq 0 ]]; then
  exec nix develop path:/workspace#frontend
else
  exec nix develop path:/workspace#frontend -c "$@"
fi
