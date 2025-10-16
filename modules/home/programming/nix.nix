{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    itsEthan.programming.nix.enable = lib.mkEnableOption "Enables nix programming tools";
  };

  config = lib.mkIf config.itsEthan.programming.nix.enable {
    home.packages = with pkgs; [
      nixd
      nil
    ];
  };

}
