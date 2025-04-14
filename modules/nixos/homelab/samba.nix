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
        "personal" = {
          "path" = "/srv/personal/";
          "guest ok" = "no";
          "guest only" = "no";
          "create mask" = "0664";
          "directory mask" = "0775";
          "write list" = "ethan";
          "valid users" = "ethan";
          "read list" = "ethan";
        };
      };
    };

    # Set password for the samba server with `sudo smbpasswd -a <username>`
    users.users = {
      "amanda".isNormalUser = true;
      "erin".isNormalUser = true;
      "jaxon".isNormalUser = true;
      "mason".isNormalUser = true;
      "mitchell".isNormalUser = true;
      "payton".isNormalUser = true;
    };
  };
}
