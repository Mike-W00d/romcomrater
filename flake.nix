{
  description = "Rom Com Rater Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      perSystem = {
        config,
        pkgs,
        system,
        lib,
        ...
      }: let
        core_packages = with pkgs; [
          zsh
          terraform
          terragrunt
          kubectl
          kubernetes-helm
          uv
          nodejs_24
        ;]
        
        dev_tools = with pkgs; [
          k9s
        ];
      in {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfreePredicate = pkg:
            builtins.elem (lib.getName pkg) [
              "terraform"
            ];
        };
        
        devShells.default = pkgs.mkShell {
          buildInputs = core_packages ++ dev_tools;
          shellHook = ''
            echo ""
            echo "🎬 Welcome to Rom Com Rater 🎬"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo ""
          '';
        };
      };
    };
}
