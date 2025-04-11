{
  config,
  lib,
  ...
}:
with lib; {
  options.custom.shell.oh-my-posh = {
    enable = mkOption {
      default = true;
      description = "Enable the oh my posh prompt for the terminal";
      type = types.bool;
    };
  };

  config = lib.mkIf config.custom.shell.oh-my-posh.enable {
    programs = {
      oh-my-posh = {
        enable = true;
        enableZshIntegration = true;
        settings = builtins.fromJSON (
          builtins.unsafeDiscardStringContext (builtins.readFile ./config.json)
        );
      };
    };
  };
}
