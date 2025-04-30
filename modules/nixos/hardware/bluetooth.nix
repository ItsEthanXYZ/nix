{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    custom.hardware.bluetooth.enable = lib.mkEnableOption "Enables bluetooth support";
  };

  config = lib.mkIf config.custom.hardware.bluetooth.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
      overskride
    ];
  };
}
