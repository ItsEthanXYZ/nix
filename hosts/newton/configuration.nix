{ ... }:
{
  itsEthan = {
    network = {
      enable = true;
      name = "newton";
    };
  };

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    watchIdAuth = true;
  };

  system.stateVersion = 6;
}
