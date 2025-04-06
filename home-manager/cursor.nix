# https://github.com/nix-community/home-manager/blob/master/modules/programs/vscode.nix
{ pkgs, ... }:
{
  programs.vscode = {
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