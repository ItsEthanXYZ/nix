{
  config,
  lib,
  ...
}: {
  imports = [
    ./blocky
    ./nextcloud.nix
    ./tandoor.nix
    ./teamspeak.nix
  ];

  options = {
    custom.homelab.enable = lib.mkEnableOption "Enable homelab";
  };

  config = lib.mkIf config.custom.homelab.enable {
    custom.homelab.blocky.enable = lib.mkDefault true;
    custom.homelab.nextcloud.enable = lib.mkDefault true;
    custom.homelab.tandoor.enable = lib.mkDefault true;
    custom.homelab.teamspeak.enable = lib.mkDefault true;
  };
}
