{
  config,
  lib,
  ...
}:
with lib; {
  options.custom.network.syncthing = {
    enable = mkOption {
      default = true;
      description = "Enables syncthing";
      type = types.bool;
    };
  };

  config = mkIf config.custom.network.syncthing.enable {
    services = {
      syncthing = {
        enable = true;
        overrideDevices = true;
        overrideFolders = true;
        settings = {
          devices = {
            "newton" = {id = "LEXBBIA-TNBDP4Q-UG4KF3E-EIUG355-EPZZTFO-OX76U7P-WTSVMHZ-SZ3MWAF";};
          };
          folders = {
            "Files" = {
              path = "/Users/ethanbrady/Files";
              devices = ["newton"];
            };
          };
        };
      };
    };
  };
}
