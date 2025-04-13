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
          "workgroup" = "WORKGROUP";
          "server string" = "smbnix";
          "netbios name" = "smbnix";
          "security" = "user";
          "guest account" = "nobody";
          "map to guest" = "bad user";
        };
        "shared" = {
          "path" = "/srv/shared/";
          "guest ok" = "no";
          "guest only" = "no";
          "create mask" = "0664";
          "directory mask" = "0775";
          "write list" = "@users";
          "valid users" = "@users";
          "read list" = "@users";
        };
      };
    };

    users.users = {
      "mason" = {
        isNormalUser = true;
      };
    };
  };
}
