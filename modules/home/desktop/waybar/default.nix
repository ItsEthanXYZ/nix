{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    custom.desktop.waybar.enable = lib.mkEnableOption "Enables waybar";
  };

  config = lib.mkIf config.custom.desktop.waybar.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          reload_style_on_change = true;

          modules-left = ["clock"];
          modules-center = ["hyprland/workspaces"];
          modules-right = ["pulseaudio#output" "pulseaudio#input"];

          "hyprland/workspaces" = {
            "format" = "{icon}";
            "format-icons" = {
              "active" = "";
              "default" = "";
              "empty" = "";
            };
            "persistent-workspaces" = {
              "*" = [1 2 3 4 5];
            };
          };

          "clock" = {
            "timezone" = "America/Denver";
            "tooltip-format" = "<tt>{calendar}</tt>";
            "format" = "{:%Y/%m/%d %H:%M}";
            "interval" = 1;
            "calendar" = {
              "format" = {
                "today" = "<span color='#fAfBfC'><b>{}</b></span>";
              };
            };
          };

          "pulseaudio#output" = {
            "scroll-step" = 5;
            "format" = "{icon}  {volume}%";
            "format-muted" = "";
            "format-icons" = {
              "default" = ["" "" " "];
            };
            "on-click" = "ghostty --title=pulsemixer -e pulsemixer";
          };
          "pulseaudio#input" = {
            "scroll-step" = 0;
            "format" = "{format_source}";
            "format-source" = "";
            "format-source-muted" = "";
            "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          };
        };
      };
    };

    home.packages = with pkgs; [
      pulsemixer
    ];

    wayland.windowManager.hyprland.settings = lib.mkIf config.custom.desktop.hyprland.enable {
      "exec-once" = ["waybar"];
    };
  };
}
