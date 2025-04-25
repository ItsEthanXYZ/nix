{
  config,
  lib,
  pkgs,
  ...
}: let
  isLinux = pkgs.stdenv.isLinux;
in {
  imports = [
    ./ghostty.nix
  ];

  options = {
    custom.apps.enable = lib.mkEnableOption "Enables apps configuration";
  };

  config = lib.mkIf config.custom.apps.enable {
    custom.apps.ghostty.enable = lib.mkDefault true;
    programs.vesktop.enable = lib.mkDefault true;

    home.packages = with pkgs;
      lib.optionals isLinux [
        kdePackages.okular
        vivaldi
      ];
  };
}
