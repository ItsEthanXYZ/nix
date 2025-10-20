{ config, lib, ... }:
{
  # TODO: Add aerospace module
  imports = [
  ];

  options = {
    itsEthan.desktop.enable = lib.mkEnableOption "Enables all custom desktop modules and config";
  };

  config = lib.mkIf config.itsEthan.desktop.enable {
    system.defaults = {
      ".GlobalPreferences"."com.apple.mouse.scaling" = -1.0;
      NSGlobalDomain = {
        AppleInterfaceStyleSwitchesAutomatically = true;
        AppleShowAllExtensions = true;
      };
      WindowManager = {
        EnableTilingByEdgeDrag = false;
        EnableTilingOptionAccelerator = false;
        EnableTopTilingByEdgeDrag = false;
      };
      controlcenter = {
        BatteryShowPercentage = false;
      };
      dock = {
        autohide = true;
        orientation = "right";
      };
      finder = {
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "Nlsv";
        FXRemoveOldTrashItems = true;
        ShowPathbar = true;
      };
    };
  };
}
