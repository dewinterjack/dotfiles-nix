{ pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
  ];

  home = {
    stateVersion = "24.11";

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      devenv
      nixd
    ];

    sessionVariables = {
    };
  };
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  services.ollama.enable = true;
}
