{
  config,
  lib,
  ...
}:
{
  imports = [
    ./ssh.nix
  ];

  options = {
    itsEthan.network.enable = lib.mkEnableOption "Enables all network configuration";
  };

  config = lib.mkIf config.itsEthan.network.enable {
    itsEthan.network.ssh.enable = true;
  };

}
