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
    custom.syncthing.enable = lib.mkDefault true;
  };
}
