{...}: {
  custom = {
    apps.enable = true;
    cli.enable = true;
    desktop.enable = true;
  };

  home.stateVersion = "24.05";
  home.username = "ethan";
  home.homeDirectory = "/Users/ethan";
  programs.home-manager.enable = true;
}
