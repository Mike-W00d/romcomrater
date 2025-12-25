FROM nixos/nix:2.33.0

ENV NIX_CONFIG="experimental-features = nix-command flakes"

COPY ./flake.* /workspace/

RUN nix develop /workspace/#backend -c true
