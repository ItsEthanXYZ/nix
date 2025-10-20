{ ... }:
{
  itsEthan = {
    enable = true;
    network = {
      name = "newton";
    };
  };

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    watchIdAuth = true;
  };

  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = "ethan";
}
