{ config, lib, ... }:
{
  imports = [
    ./javascript.nix
    ./nix.nix
    ./tex.nix
  ];

  options = {
    itsEthan.programming.enable = lib.mkEnableOption "Enables all custom programming modules and config";
  };

  config = lib.mkIf config.itsEthan.programming.enable {
    itsEthan.programming = {
      javascript.enable = true;
      nix.enable = true;
      tex.enable = true;
    };
  };
}
