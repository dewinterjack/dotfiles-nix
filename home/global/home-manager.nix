{
  config,
  pkgs,
  ...
}:
{
  home = {
    stateVersion = "24.11";

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