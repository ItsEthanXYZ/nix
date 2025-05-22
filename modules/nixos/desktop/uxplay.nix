{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.custom.desktop.uxplay = {
    enable = mkOption {
      default = false;
      description = "Enables uxplay, deps, and a port range to use";
      type = types.bool;
    };
    port = mkOption {
      default = 9100;
      description = "The port to use for uxplay (will use port, ort+1, and port+2)";
      type = types.int;
    };
  };

  config = mkIf config.custom.desktop.uxplay.enable {
    environment.systemPackages = with pkgs; [
      uxplay
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-good
      gst_all_1.gst-libav
    ];

    networking.firewall = {
      allowedTCPPorts = [
        config.custom.desktop.uxplay.port
        (config.custom.desktop.uxplay.port + 1)
        (config.custom.desktop.uxplay.port + 2)
      ];
      allowedUDPPorts = [
        config.custom.desktop.uxplay.port
        (config.custom.desktop.uxplay.port + 1)
        (config.custom.desktop.uxplay.port + 2)
      ];
    };
  };
}
