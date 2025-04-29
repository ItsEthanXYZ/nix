{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  theme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
in {
  options.custom.theme = {
    enable = mkOption {
      default = true;
      description = "Enables the custom theme";
      type = types.bool;
    };
  };

  config = mkIf config.custom.theme.enable {
    stylix = {
      enable = true;
      base16Scheme = theme;
      polarity = "dark";
      cursor = {
        package = pkgs.banana-cursor;
        # Find the cursor name with...
        # nix build nixpkgs#<cursor-package>
        # cd result
        # nix run nixpkgs#eza -- --tree --level 3
        name = "Banana";
        size = 24;
      };
      fonts = {
        sizes = {
          applications = 16;
          desktop = 14;
          popups = 10;
          terminal = 16;
        };
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };

        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };

        monospace = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans Mono";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
      };
    };
  };
}
