{ config, lib, ... }:
{
  imports = [
    ./javascript.nix
  ];

  options = {
    itsEthan.programming.enable = lib.mkEnableOption "Enables all programming tools";
  };

  config = lib.mkIf config.itsEthan.programming.enable {
    itsEthan.programming = {
      javascript.enable = true;
    };
  };
}
