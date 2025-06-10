{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./jankyborders.nix
    ./sketchybar.nix
    ./skhd.nix
    ./yabai.nix
  ];

  options = {
    custom.desktop.enable = lib.mkEnableOption "Enables the custom desktop configuration for darwin";
  };

  config = lib.mkIf config.custom.desktop.enable {
    custom.desktop = {
      jankyborders.enable = lib.mkDefault false;
      sketchybar.enable = lib.mkDefault false;
      skhd.enable = lib.mkDefault false;
      yabai.enable = lib.mkDefault false;
    };

    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
      noto-fonts
      noto-fonts-monochrome-emoji
    ];
  };
}
