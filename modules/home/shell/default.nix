{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./oh-my-posh
    ./zsh.nix
  ];

  options = {
    custom.shell.enable = lib.mkEnableOption "Enables the shell and configuration";
  };

  config = lib.mkIf config.custom.shell.enable {
    custom.shell = {
      oh-my-posh.enable = lib.mkDefault true;
      zsh.enable = lib.mkDefault true;
    };

    home.packages = [
      inputs.sourceweaver.packages.${pkgs.system}.default
    ];
  };
}
