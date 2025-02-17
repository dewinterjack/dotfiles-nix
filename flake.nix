{
  description = "Nix System Configuration for Jack";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    darwin,
    home-manager,
    nixos-wsl,
    ...
  } @ inputs: let
    darwinSystem = {user, arch ? "aarch64-darwin", dockAutoHide ? false}:
      darwin.lib.darwinSystem {
        system = arch;
        modules = [
          ./darwin/darwin.nix
          home-manager.darwinModules.home-manager
          {
            _module.args = { inherit inputs; };
            home-manager = {
              users.${user} = import ./home-manager;
            };
            users.users.${user}.home = "/Users/${user}";
            nix.settings.trusted-users = [ user ];
            system.defaults.dock.autohide = dockAutoHide;
          }
        ];
      };
  in
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.wsl
          ./nixos/configuration.nix
          ./.config/wsl
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.nixos = import ./home-manager;
            };
            nix.settings.trusted-users = [ "nixos" ];
          }
        ];
      };
    };
    darwinConfigurations = {
      "Jacks-Mac-Studio" = darwinSystem {
        user = "jackdewinter";
        dockAutoHide = false;
      };
      "Jacks-MacBook-Air" = darwinSystem {
        user = "jackdewinter";
        dockAutoHide = true;
      };
    };
  };
}