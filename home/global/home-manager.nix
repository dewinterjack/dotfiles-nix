{
  config,
  pkgs,
  ...
}:
{
  home = {
    stateVersion = "24.05";

    packages = with pkgs; [
      devenv
      nixd
    ];

    sessionVariables = {
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}