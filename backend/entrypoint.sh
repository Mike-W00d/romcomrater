#!/bin/bash
set -euo pipefail

if [[ "$#" -eq 0 ]]; then
  exec nix develop path:/workspace#backend
else
  exec nix develop path:/workspace#backend -c "$@"
fi
