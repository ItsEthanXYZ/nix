{
  config,
  lib,
  ...
}:
{
  imports = [
    ./oh-my-posh
    ./zsh.nix
  ];

  options = {
    itsEthan.shell.enable = lib.mkEnableOption "Enables all shell configuration";
  };

  config = lib.mkIf config.itsEthan.shell.enable {
    itsEthan.shell.oh-my-posh.enable = true;
    itsEthan.shell.zsh.enable = true;
  };

}
