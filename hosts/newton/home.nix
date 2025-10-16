{ lib, ... }:
{
  itsEthan = {
    cli.enable = true;
    network.enable = true;
    programming.enable = true;
    shell.enable = true;
  };

  home.stateVersion = "24.05";
  home.username = lib.mkForce "ethan";
  home.homeDirectory = lib.mkForce "/Users/ethan";
  programs.home-manager.enable = true;
}
