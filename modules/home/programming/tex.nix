{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    itsEthan.programming.tex.enable = lib.mkEnableOption "Enables tex typesetting tools";
  };

  config = lib.mkIf config.itsEthan.programming.tex.enable {
    home.packages = with pkgs; [
      texliveMedium
    ];
  };

}
