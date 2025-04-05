{ pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
    	enable = true;
			plugins = [ "git" ];
			theme = "agnoster";
    };
    shellAliases = {
    	ll = "ls -l";
    	update = "darwin-rebuild switch --flake ~/code/dotfiles-nix";
    };
		initExtra = ''
			. ${../.config/zsh/.zshrc}
		'';
  };
}
