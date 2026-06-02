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
      # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
			theme = "agnoster";
    };
    shellAliases = {
    	ll = "ls -l";
    	update = "darwin-rebuild switch --flake ~/code/dotfiles-nix";
    };
		initExtra = ''
			if command -v fnm >/dev/null 2>&1; then
				eval "$(fnm env --use-on-cd --shell zsh)"
			fi

			. ${../.config/zsh/.zshrc}
		'';
  };
}
