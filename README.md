# dotfiles

## Install

Install nix:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Install dotfiles:

```bash
nix run nix-darwin -- switch --flake github:dewinterjack/dotfiles-nix
```

## Update

```bash
darwin-rebuild switch --flake ~/code/dotfiles-nix
```
