{
  config,
  lib,
  ...
}: {
  options = {
    custom.homelab.teamspeak.enable = lib.mkEnableOption "Enables teamspeak 3 server";
  };

  config = lib.mkIf config.custom.homelab.teamspeak.enable {
    services.teamspeak3 = {
      enable = true;
      openFirewall = true;
    };
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "teamspeak-server"
      ];
  };
}
