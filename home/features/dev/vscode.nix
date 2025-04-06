# https://github.com/nix-community/home-manager/blob/master/modules/programs/vscode.nix
{
  config,
  pkgs,
  lib,
  ...
}: 
let
  inherit (lib) mkIf;
  cfg = config.home-config.dev;
in
{
  programs.vscode = mkIf cfg.vscode.enable {
    enable = true;
    package = pkgs.code-cursor;
    profiles = {
      default = {
        enableExtensionUpdateCheck = true;
        enableUpdateCheck = false;
        extensions = with pkgs.vscode-extensions; [
          eamodio.gitlens
          esbenp.prettier-vscode
          dbaeumer.vscode-eslint
          jnoortheen.nix-ide
        ];
        keybindings = [
          # {
          #   key = "";
          #   command = "";
          # }
        ];
        userSettings = {
          "editor" = {
            "formatOnSave" = true;
          };
          "git" = {
            "autoFetch" = true;
            "confirmSync" = false;
          };
        };
      };
    };
  };
}