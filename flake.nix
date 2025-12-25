{
  description = "Rom Com Rater Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ { self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem = { config, pkgs, system, lib, ... }:
      let
        core_packages = with pkgs; [
          bash
          coreutils
          git
        ];

        backend_packages = with pkgs; [
          uv
          python314
        ];

        frontend_packages = with pkgs; [
          nodejs_24
        ];

        deployment_packages = with pkgs; [
          terraform
          terragrunt
          kubectl
          kubernetes-helm
        ];

        dev_tools = with pkgs; [
          zsh
          k9s
          docker-compose
        ];

        all_packages = core_packages
          ++ backend_packages
          ++ frontend_packages
          ++ deployment_packages
          ++ dev_tools;

      in
      {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfreePredicate = pkg:
            builtins.elem (lib.getName pkg) [ "terraform" ];
        };

        devShells.default = pkgs.mkShell {
          buildInputs = all_packages;
          shellHook = ''
            echo ""
            echo "🎬 Welcome to Rom Com Rater 🎬"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo ""
          '';
        };

        devShells.backend = pkgs.mkShell {
          buildInputs = core_packages ++ backend_packages;
          shellHook = ''
            echo ""
            echo "🐍 Rom Com Rater backend 🐍"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo ""
          '';
        };

        devShells.frontend = pkgs.mkShell {
          buildInputs = core_packages ++ frontend_packages;
          shellHook = ''
            echo ""
            echo "⚡ Rom Com Rater frontend ⚡"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo ""
          '';
        };
      };
    };
}
