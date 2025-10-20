{
  config,
  lib,
  ...
}:
{
  options = {
    itsEthan.network.enable = lib.mkEnableOption "Enables all custom network modules and config";
    itsEthan.network.name = lib.mkOption {
      type = lib.types.str;
      default = null;
      description = "Name of this computer on the network";
    };
  };

  config = lib.mkIf config.itsEthan.network.enable {
    networking = {
      computerName = config.itsEthan.network.name;
      hostName = config.itsEthan.network.name;
      localHostNames = config.itsEthan.network.name;
    };
  };
}
