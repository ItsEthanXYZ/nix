{lib, pkgs, ...}: {
  # custom = {
  #   apps.enable = true;
  #   cli.enable = true;
  #   desktop.enable = true;
  # };

  home.stateVersion = "24.05";
  home.username = lib.mkForce "ethan";
  home.homeDirectory = lib.mkForce "/Users/ethan";
  programs.home-manager.enable = true;
  programs.zsh.enable = true;

  home.packages = with pkgs; [
    nodejs
    pnpm
    prettierd
    nixd
    nil
    rustc
    cargo
  ];
}
