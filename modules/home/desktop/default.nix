{
  config,
  lib,
  pkgs,
  ...
}: let
  isLinux = pkgs.stdenv.isLinux;
in {
  imports = [
    ./hyprland
    ./tofi.nix
    ./waybar
    ./wofi.nix
  ];

  options = {
    custom.desktop.enable = lib.mkEnableOption "Enables desktop configuration";
  };

  config = lib.mkIf (config.custom.desktop.enable && isLinux) {
    custom.desktop.hyprland.enable = lib.mkDefault true;
    custom.desktop.waybar.enable = lib.mkDefault true;
    custom.desktop.tofi.enable = lib.mkDefault true;
  };
}
