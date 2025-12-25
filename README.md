# Rom Com Rater

## Dev Env

### Dependencies

This project uses a nix development shell for all core dependencies and direnv to auto load it:

- Install nix: https://nixos.org/download/
- Install direnv: https://direnv.net/docs/installation.html
- Install docker engine or docker compatible other container runtime: https://docs.docker.com/engine/install/

Enable flakes in nix config: 

```
sudo vim /etc/nix/nix.conf
```

Add line: 

```
experimental-features = nix-command flakes
```

Add direnv shell hook to zsh:

```
vim ~/.zshrc
```

Add lines:

```
eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=
```

Then in the project root directory enter the nix development shell by enabling direnv:

```
direnv allow
```

# To Do

- Base fast api python setup
- Docker compose
- CI/CD pipeline - test, build, deploy
