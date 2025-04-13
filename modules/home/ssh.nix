{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.custom.ssh = {
    enable = mkOption {
      default = true;
      description = "Enables ssh and automatically generates ed25519 keys if they don't exist";
      type = types.bool;
    };
  };

  config = mkIf config.custom.ssh.enable {
    home.activation.generateSSHKey = hm.dag.entryAfter ["writeBoundary"] ''
      if [ ! -f ${config.home.homeDirectory}/.ssh/id_ed25519 ]; then
        ${pkgs.openssh}/bin/ssh-keygen -t ed25519 -f ${config.home.homeDirectory}/.ssh/id_ed25519 -q -N ""
      fi
    '';

    programs.ssh = {
      enable = true;
      matchBlocks = {
        bernoulli = mkDefault {
          host = "bernoulli";
          hostname = "bernoulli.tailnet.ethanbrady.xyz";
          user = "ethan";
        };
        newton = mkDefault {
          host = "newton";
          hostname = "newton.tailnet.ethanbrady.xyz";
          user = "ethanbrady";
        };
        morse = mkDefault {
          host = "morse";
          hostname = "ethanbrady.xyz";
          user = "ethan";
        };
        mohs = mkDefault {
          host = "mohs";
          hostname = "mohs.tailnet.ethanbrady.xyz";
          user = "ethan";
        };
      };
    };
  };
}
