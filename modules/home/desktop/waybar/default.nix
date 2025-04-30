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
    stylix.targets.waybar.addCss = false;

    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          reload_style_on_change = true;

          modules-left = ["clock" "tray" "gamemode"];
          modules-center = ["hyprland/workspaces"];
          modules-right = ["pulseaudio#output" "pulseaudio#input" "network" "bluetooth" "battery"];

          "clock" = {
            "timezone" = "America/Denver";
            "tooltip-format" = "<tt>{calendar}</tt>";
            "format" = "{:%a %Y/%m/%d %H:%M}";
            "interval" = 1;
            "calendar" = {
              "format" = {
                "today" = "<span color='#fAfBfC'><b>{}</b></span>";
              };
            };
          };

          "tray" = {
            "icon-size" = 16;
            "spacing" = 8;
          };

          "gamemode" = {
            "format" = "{glyph}";
            "format-alt" = "{glyph}";
            "glyph" = "󰊖";
            "hide-not-running" = true;
            "use-icon" = true;
            "icon-size" = 20;
            "tooltip" = true;
            "tooltip-format" = "Games running: {count}";
          };

          "hyprland/workspaces" = {
            "format" = "{icon}";
            "format-icons" = {
              "active" = "";
              "default" = "";
              "empty" = "";
            };
            "persistent-workspaces" = {
              "*" = [1 2 3 4];
            };
          };

          "pulseaudio#output" = {
            "scroll-step" = 5;
            "format" = "{icon} {volume}%";
            "format-muted" = "󰖁";
            "format-icons" = {
              "default" = ["󰕿" "󰖀" "󰕾"];
            };
            "on-click" = "ghostty --title=pulsemixer -e pulsemixer";
          };
          "pulseaudio#input" = {
            "scroll-step" = 0;
            "format" = "{format_source}";
            "format-source" = "󰍬 {volume}%";
            "format-source-muted" = "󰍭";
            "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          };
          "network" = {
            "format-wifi" = "{icon} ";
            "format-ethernet" = "󰈀 ";
            "format-disconnected" = "󰲜 ";
            "format-icons" = ["󰤟" "󰤢" "󰤥" "󰤨"];
          };
          "bluetooth" = {
            "format" = "";
            "format-disabled" = "󰂲";
            "format-off" = "󰂲";
            "format-connected" = "󰂱";
            "on-click" = "blueman-manager";
          };
          "battery" = {
            "states" = {
              "warning" = 30;
              "critical" = 15;
            };
            "format" = "{icon} {capacity}";
            "format-charging" = "󱐋 {capacity}";
            "format-plugged" = "󱐥";
            "format-alt" = "{icon} {capacity}";
            "format-icons" = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          };
        };
      };

      style =
        /*
        css
        */
        ''
          /* Overall styling */
          window#waybar {
            background-color: transparent;
          }

          /* Left modules */
          .modules-left {
            padding: 0px;
            margin: 0 0 0 0;
            border-radius: 0;
            background: transparent;
          }
          #clock, #tray, #gamemode {
            padding: 8px;
            margin: 10 0 5 10;
            border-radius: 8px;
            background: alpha(@base00, 0.75);
            box-shadow: 0 0 2px rgba(0, 0, 0, 0.75);
          }
          #gamemode {
            padding-right: 5px;
          }

          /* Center modules */
          .modules-center {
            padding: 8px;
            margin: 10 0 5 10;
            border-radius: 8px;
            background: alpha(@base00, 0.75);
            box-shadow: 0 0 2px rgba(0, 0, 0, 0.75);
          }
          #workspaces {
            padding: 0 4px;
          }
          #workspaces button {
            all:unset;
            padding: 0px 4px;
            color: alpha(@base0D,.4);
            transition: all .2s ease;
          }
          #workspaces button:hover {
            color:rgba(0,0,0,0);
            border: none;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
            transition: all 1s ease;
          }
          #workspaces button.active {
            color: @base0D;
            border: none;
            text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
          }
          #workspaces button.empty {
            color: rgba(0,0,0,0);
            border: none;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
          }
          #workspaces button.empty:hover {
            color: rgba(0,0,0,0);
            border: none;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
            transition: all 1s ease;
          }
          #workspaces button.empty.active {
            color: @base0D;
            border: none;
            text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
          }

          /* Right modules */
          .modules-right {
            padding: 0px;
            margin: 0 0 0 0;
            border-radius: 0;
            background: transparent;
          }
          #pulseaudio, #bluetooth, #battery, #network {
            padding: 8px;
            margin: 10 10 5 0;
            border-radius: 8px;
            background: alpha(@base00, 0.75);
            box-shadow: 0 0 2px rgba(0, 0, 0, 0.75);
          }
          #pulseaudio.output.sink-muted {
            color: @base08;
          }
          #pulseaudio.input.source-muted {
            color: @base08;
          }
          #network.wifi {
            padding-right: 5px;
          }
          #network.ethernet, #network.disconnected {
            padding-right: 3px;
          }
          #network.disconnected {
            color: @base08;
          }
          #bluetooth {
            color: @base0D;
          }
          #bluetooth.disabled, #bluetooth.off {
            color: @base08;
          }
          #battery.plugged, #battery.charging {
            color: @base0B;
          }
          #battery.warning:not(.charging) {
            color: @base0A;
          }
          #battery.critical:not(.charging) {
            color: @base08;
          }
        '';
    };

    home.packages = with pkgs; [
      pulsemixer
    ];

    wayland.windowManager.hyprland.settings = lib.mkIf config.custom.desktop.hyprland.enable {
      "exec-once" = ["waybar"];
    };
  };
}
