{
  config,
  lib,
  ...
}:
{
  imports = [
    ./builtin.nix
    ./git.nix
  ];

  options = {
    itsEthan.cli.enable = lib.mkEnableOption "Enables all custom cli modules and config";
  };

  config = lib.mkIf config.itsEthan.cli.enable {
    itsEthan.cli = {
      builtin.enable = true;
      git.enable = true;
    };
  };

}
