{ config, lib, ... }:
{
  imports = [
    ./desktop
    ./network
  ];

  options = {
    itsEthan.enable = lib.mkEnableOption "Enables all custom darwin modules and config";
  };

  config = lib.mkIf config.itsEthan.enable {
    nix.settings.experimental-features = "nix-command flakes";
    system.defaults.NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleMeasurementUnits = "Centimeters";
      AppleTemperatureUnit = "Celsius";
      AppleMetricUnits = 1;
    };

    itsEthan = {
      desktop.enable = true;
      network.enable = true;
    };
  };
}
