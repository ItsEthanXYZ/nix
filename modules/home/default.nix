{ config, lib, ... }:
{
  imports = [
    ./cli
    ./network
    ./programming
    ./shell
  ];

  options = {
    itsEthan.enable = lib.mkEnableOption "Enables all home manager custom modules";
  };

  config = lib.mkIf config.itsEthan.enable {
    itsEthan = {
      cli.enable = true;
      network.enable = true;
      programming.enable = true;
      shell.enable = true;
    };
  };
}
