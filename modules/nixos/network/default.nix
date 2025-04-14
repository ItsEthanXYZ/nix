{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./ssh.nix
    ./syncthing.nix
    ./vpn.nix
  ];

  options = {
    custom.network.enable = lib.mkEnableOption "Enables network related configurations including ssh and vpn";
  };

  config = lib.mkIf config.custom.network.enable {
    custom.network.ssh.enable = lib.mkDefault true;
    custom.network.vpn.enable = lib.mkDefault true;
    environment.systemPackages = with pkgs; [
      cifs-utils
    ];
  };
}
