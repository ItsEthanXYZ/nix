{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
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
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
      cursor = {
        package = pkgs.banana-cursor;
        # Find the cursor name with...
        # nix build nixpkgs#<cursor-package>
        # cd result
        # nix run nixpkgs#eza -- --tree --level 3
        name = "Banana";
      };
    };
  };
}
