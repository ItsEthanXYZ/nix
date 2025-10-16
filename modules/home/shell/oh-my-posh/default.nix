{
  config,
  lib,
  ...
}:
{
  options.itsEthan.shell.oh-my-posh = {
    enable = lib.mkEnableOption "Enables oh my posh configuration";
  };

  config = lib.mkIf config.itsEthan.shell.oh-my-posh.enable {
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
