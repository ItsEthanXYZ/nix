{
  config,
  lib,
  ...
}:
with lib; {
  options.custom.network.syncthing = {
    enable = mkOption {
      default = false;
      description = "Enables syncthing";
      type = types.bool;
    };
  };

  config = mkIf config.custom.network.syncthing.enable {
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
    };
  };
}
