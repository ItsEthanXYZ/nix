{
  config,
  lib,
  ...
}: {
  options = {
    custom.system.enable = lib.mkEnableOption "Enables preffered system settings for MacOS";
  };

  config = lib.mkIf config.custom.system.enable {
    # Allow sudo commands to be run with biometrics
    security.pam.services.sudo_local.touchIdAuth = true;
    # Set mouse tracking speed
    system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = 1.0;
    # Enable metric units
    system.defaults.NSGlobalDomain.AppleMetricUnits = 1;
    # Allow quiting finder
    system.defaults.finder.QuitMenuItem = true;
  };
}
