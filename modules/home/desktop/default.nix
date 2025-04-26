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
    ./rofi.nix
    ./waybar
  ];

  options = {
    custom.desktop.enable = lib.mkEnableOption "Enables desktop configuration";
  };

  config = lib.mkIf (config.custom.desktop.enable && isLinux) {
    custom.desktop.hyprland.enable = lib.mkDefault true;
    custom.desktop.waybar.enable = lib.mkDefault true;
    custom.desktop.rofi.enable = lib.mkDefault true;
  };
}
