{ pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
    	enable = true;
    };
    shellAliases = {
    	ll = "ls -l";
    	update = "darwin-rebuild switch --flake ~/code/dotfiles-nix";
    };
  };
}
