{ lib, pkgs, ... }:

lib.mkIf pkgs.stdenv.isDarwin {
  home.file."Library/Application Support/iTerm2/DynamicProfiles/Profiles.json".source =
    ./iterm2/Profiles.json;

  targets.darwin.defaults."com.googlecode.iterm2"."Default Bookmark Guid" =
    "7B564C6D-892D-40D3-B4FB-8198C0020D84";
}
