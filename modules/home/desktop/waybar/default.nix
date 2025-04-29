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
              "*" = [1 2 3 4];
            };
          };

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
            "format-source" = "󰍬";
            "format-source-muted" = "󰍭";
            "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          };
        };
      };

      style = ''
        window#waybar {
          background-color: transparent;
        }

        .modules-left {
          padding: 8px;
          margin: 10 0 5 10;
          border-radius: 8px;
          background: alpha(@base00, 0.6);
          box-shadow: 0 0 2px rgba(0, 0, 0, 0.75);
        }

        .modules-center {
          padding: 8px;
          margin: 10 0 5 10;
          border-radius: 8px;
          background: alpha(@base00, 0.6);
          box-shadow: 0 0 2px rgba(0, 0, 0, 0.75);
        }

        .modules-right {
          padding: 8px;
          margin: 10 10 5 0;
          border-radius: 8px;
          background: alpha(@base00, 0.6);
          box-shadow: 0 0 2px rgba(0, 0, 0, 0.75);
        }

        #clock {
          padding: 0 4px;
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

        #pulseaudio {
          color: @base0B;
        }
        #pulseaudio.input {
          padding: 0 4px 0 0;
        }
        #pulseaudio.output {
          padding: 0 8px 0 0;
        }

        #pulseaudio.output.sink-muted {
          color: @base08;
        }
        #pulseaudio.input.source-muted {
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
