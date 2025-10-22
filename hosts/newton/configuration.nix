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

  homebrew = {
    enable = true;
    casks = [ "ghostty" ];
  };

  environment.extraInit = ''
    if [ -x /opt/homebrew/bin/brew ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
  '';

  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = "ethan";
}
