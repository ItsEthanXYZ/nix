{
  config,
  lib,
  ...
}:
{
  options = {
    itsEthan.shell.carapace.enable = lib.mkEnableOption "Enables carapace and custom configuration";
  };

  config = lib.mkIf config.itsEthan.shell.carapace.enable {
    programs = {
      carapace = {
        enable = true;
        enableZshIntegration = true;
      };
   };
  };
}
