{ config, lib, ... }:
{
  imports = [
    ./network
  ];

  options = {
    itsEthan.enable = lib.mkEnableOption "Enables all custom darwin modules and config";
  };

  config = lib.mkIf config.itsEthan.enable {
    nix.settings.experimental-features = "nix-command flakes";

    itsEthan = {
      network.enable = true;
    };
  };
}
