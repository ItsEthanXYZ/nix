{...}: {
  custom = {
    enable = true;
    bootloader.enable = true;
    desktop = {
      enable = true;
      sunshine.enable = true;
    };
    docker.enable = true;
    gaming.enable = true;
    network.syncthing.enable = true;
    hardware = {
      audio.enable = true;
      bluetooth.enable = true;
      laptop.enable = true;
      nvidia.enable = true;
      peripherals.enable = true;
    };
    obs.enable = true;
  };

  networking.hostName = "bernoulli";
  nixpkgs.system = "x86_64-linux";
  system.stateVersion = "23.11";
}
