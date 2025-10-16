{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    itsEthan.programming.javascript.enable = lib.mkEnableOption "Enables javascript programming tools";
  };

  config = lib.mkIf config.itsEthan.programming.javascript.enable {
    home.packages = with pkgs; [
      nodejs_24
      pnpm_9
      bun
      biome
    ];
  };

}
