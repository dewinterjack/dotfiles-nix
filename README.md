# dotfiles

## Install

Install nix

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Install dotfiles

```bash
sudo -H nix run nix-darwin/master#darwin-rebuild -- switch --flake github:dewinterjack/dotfiles-nix
```

It will infer the host and use the appropriate configuration however if the host doesn't match it will fail. You can specify which configuration to use like this

```bash
sudo -H nix run nix-darwin/master#darwin-rebuild -- switch --flake github:dewinterjack/dotfiles-nix#Jacks-Mac-Studio
```

## Update

```bash
darwin-rebuild switch --flake ~/code/dotfiles-nix
```

## Uninstall

```bash
sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin#darwin-uninstaller
```