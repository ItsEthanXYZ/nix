{
  config,
  lib,
  ...
}:
with lib; {
  options.custom.homelab.samba = {
    enable = mkEnableOption "Enable Samba";
  };

  config = mkIf config.custom.homelab.samba.enable {
    services.samba = {
      enable = true;
      openFirewall = true;
      settings = {
        global = {
          "workgroup" = "SAMBASHARE";
          "server string" = "smbnix";
          "netbios name" = "smbnix";
          "security" = "user";
          "guest account" = "nobody";
          "map to guest" = "bad user";
        };
        "public" = {
          "path" = "/srv/public/";
          "browseable" = "yes";
          "writable" = "yes";
          "guest ok" = "yes";
          "create mask" = "0777";
          "directory mask" = "2777";
          "force user" = "nobody";
          "force group" = "nogroup";
        };
      };
    };

    users.users."nobody" = {
      extraGroups = [
        "nogroup"
      ];
    };
  };
}
