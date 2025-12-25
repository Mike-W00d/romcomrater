# Rom Com Rater

## Dev Env

### Dependencies

This project uses a nix development shell for all core dependencies and direnv to auto load it:

- Install nix: https://nixos.org/download/
- Install direnv: https://direnv.net/docs/installation.html

Enabled flakes in nix config:

```
sudo vim /etc/nix/nix.conf
```

Add line: 

```
experimental-features = nix-command flakes
```

Then enable nix and enter development shell in the project root directory:

```
direnv allow
```
