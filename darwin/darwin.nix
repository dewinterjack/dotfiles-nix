{ pkgs, ... }:

{
  # Match the build group ID created by the Lix installer on macOS.
  ids.gids.nixbld = 350;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.home-manager
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/src/github.com/jackdewinter/dotfiles/darwin";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs = {
    gnupg.agent.enable = true;
    zsh.enable = true; # default shell on catalina
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  fonts.packages = [
    pkgs.atkinson-hyperlegible
    pkgs.jetbrains-mono
  ];

  services = {
    jankyborders = {
      enable = true;
      blur_radius = 5.0;
      hidpi = true;
      active_color = "0xAAB279A7";
      inactive_color = "0x33867A74";
    };
  };

  system.activationScripts.postActivation.text = ''
    ${pkgs.curl}/bin/curl -fsSL https://github.com/AikidoSec/safe-chain/releases/latest/download/install-safe-chain.sh | /bin/sh
  '';

  homebrew = {
    enable = true;

    brews = [
      "fnm" # node manager
      "gh"
    ];

    casks = [
      "1password"
      "gitkraken"
      "iterm2"
      "soundsource"
      "setapp"
      "raycast"
      "orbstack"
      "ungoogled-chromium"
      "linear"
      "hammerspoon"
      "raindropio"
      "codex"
      "codex-app"
      "obsidian"
    ];

    masApps = {
      # "Drafts" = 1435957248;
      # "Reeder" = 1529448980;
      # "Toggl" = 1291898086;
    };
  };

  system = {
    defaults = {
      dock = {
        orientation = "bottom";
        show-process-indicators = false;
        show-recents = false;
        static-only = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        ShowPathbar = true;
      };
      NSGlobalDomain = {
        AppleKeyboardUIMode = 3;
        "com.apple.keyboard.fnState" = true;
        NSAutomaticWindowAnimationsEnabled = false;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
