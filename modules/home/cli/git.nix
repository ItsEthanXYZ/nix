{
  config,
  lib,
  ...
}:
with lib; {
  options.custom.cli.git = {
    enable = mkOption {
      default = true;
      description = "Enables git";
      type = types.bool;
    };
    email = lib.mkOption {
      type = lib.types.str;
      default = "git@ethanbrady.xyz";
      description = "The email address to use for git commits";
    };
    name = lib.mkOption {
      type = lib.types.str;
      default = "EthanJ-Brady";
      description = "The name to use for git commits";
    };
  };

  config = mkIf config.custom.cli.git.enable {
    programs.git = {
      enable = true;
      userEmail = config.custom.cli.git.email;
      userName = config.custom.cli.git.name;
      extraConfig = {
        advice.skippedCherryPicks = false;
        push.autoSetupRemote = true;
      };
      delta = {
        enable = true;
        options = {
          line-numbers = true;
          side-by-side = true;
        };
      };
      aliases = {
        graph = "log --oneline --graph --decorate --all";
        s = "status -s";
        l = "log --oneline";
        d = "diff --name-status";
        last = "log -1 HEAD";
      };
    };
  };
}
