{ lib, ... }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  options.home-config = {
    dev = {
      vscode.enable = mkEnableOption ''
        Enable VSCode
      '';
    };
  };
}