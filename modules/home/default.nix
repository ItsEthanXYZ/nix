{
  config,
  lib,
  ...
}: {
  imports = [
    ./apps
    ./catppuccin
    ./cli
    ./desktop
    ./gaming
    ./shell
    ./ssh.nix
    ./syncthing.nix
  ];

  options = {
    custom.enable = lib.mkEnableOption "Enables custom configuration";
  };

  config = lib.mkIf config.custom.enable {
    custom.ssh.enable = lib.mkDefault true;
    custom.syncthing.enable = lib.mkDefault true;
  };
}
