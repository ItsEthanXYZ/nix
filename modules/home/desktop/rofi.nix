{
  config,
  lib,
  ...
}:
with lib; {
  options.custom.desktop.rofi = {
    enable = mkOption {
      default = false;
      description = "Enables rofi application launcher";
      type = types.bool;
    };
  };

  config = mkIf config.custom.desktop.rofi.enable {
    programs.rofi = {
      enable = true;
    };

    home.file = {
      ".config/rofi/nerdfont.txt".source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/8bitmcu/NerdFont-Cheat-Sheet/main/nerdfont.txt";
        sha256 = "sha256:18rzlify5g7naqqryzkvnsh7c0y8drmqa8x83mra7mxy229a81bn";
      };
    };

    wayland.windowManager.hyprland.settings.bind = [
      "SUPER, space, exec, rofi -show drun"
      "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      "SUPER, E, exec, sort ~/.config/rofi/nerdfont.txt | awk '{printf \"%s  %s\\n\", $1, $4}' | rofi -dmenu | awk '{printf \"%s\", $1}' | wl-copy"
    ];
  };
}
