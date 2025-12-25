FROM nixos/nix:2.33.0

ENV NIX_CONFIG="experimental-features = nix-command flakes"

COPY ./flake.* /workspace/

RUN nix profile install \
    --profile /nix/var/nix/profiles/backend \
    /workspace/#backend

ENV PATH="/nix/var/nix/profiles/backend/bin:${PATH}"

WORKDIR /workspace/backend

