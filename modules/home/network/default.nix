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
    itsEthan.network.enable = lib.mkEnableOption "Enables all custom network modules and config";
  };

  config = lib.mkIf config.itsEthan.network.enable {
    itsEthan.network.ssh.enable = true;
  };

}
