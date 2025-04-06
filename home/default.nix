{ pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./features
    ./global
  ];

  home-config = {
    dev = {
      vscode.enable = true;
    };
  };

  services.ollama.enable = true;
}
