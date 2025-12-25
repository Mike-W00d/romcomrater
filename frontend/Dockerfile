FROM nixos/nix:2.33.0

ENV NIX_CONFIG="experimental-features = nix-command flakes"

COPY ./flake.* /workspace/

RUN nix profile install \
    --profile /nix/var/nix/profiles/frontend \
    /workspace/#frontend

ENV PATH="/nix/var/nix/profiles/frontend/bin:${PATH}"

WORKDIR /workspace/frontend

