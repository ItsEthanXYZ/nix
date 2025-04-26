{
  config,
  lib,
  ...
}:
with lib; let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
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
      theme = {
        "*" = {
          margin = mkLiteral "0";
          padding = mkLiteral "0";
          spacing = mkLiteral "0";
        };
        window = {
          border-radius = mkLiteral "24px";
        };
        mainbox = {
          padding = mkLiteral "12px";
        };
        inputbar = {
          border = mkLiteral "2px";
          border-radius = mkLiteral "16px";
          padding = mkLiteral "8px 16px";
          spacing = mkLiteral "8px";
          children = mkLiteral "[ prompt, entry ]";
        };
        entry = {
          placeholder = "";
        };
        message = {
          margin = mkLiteral "12px 0 0";
          border-radius = mkLiteral "16px";
        };
        textbox = {
          padding = mkLiteral "8px 24px";
        };
        listview = {
          margin = mkLiteral "12px 0 0";
          lines = mkLiteral "8";
          columns = mkLiteral "1";
        };
        element = {
          padding = mkLiteral "8px 16px";
          spacing = mkLiteral "8px";
          border-radius = mkLiteral "16px";
        };
        element-icon = {
          size = mkLiteral "1em";
          vertical-align = mkLiteral "0.5";
        };
      };
    };

    home.file = {
      ".config/rofi/nerdfont.txt".source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/8bitmcu/NerdFont-Cheat-Sheet/main/nerdfont.txt";
        sha256 = "sha256:18rzlify5g7naqqryzkvnsh7c0y8drmqa8x83mra7mxy229a81bn";
      };
    };

    wayland.windowManager.hyprland.settings.bind = [
      "SUPER, space, exec, rofi -show drun"
      "SUPER, V, exec, cliphist list | rofi -dmenu -p \"Copy:\" | cliphist decode | wl-copy"
      "SUPER, E, exec, sort ~/.config/rofi/nerdfont.txt | awk '{printf \"%s  %s\\n\", $1, $4}' | rofi -dmenu -p \"Copy:\" | awk '{printf \"%s\", $1}' | wl-copy"
      "SUPER, N, exec, rofi -dmenu -p \"New Note Title:\" | xargs -I {} zk new -t \"{}\" -p | xargs ghostty -e nvim"
    ];
  };
}
