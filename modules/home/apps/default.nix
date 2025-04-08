{
  config,
  lib,
  ...
}: {
  imports = [
    ./ghostty.nix
  ];

  options = {
    custom.apps.enable = lib.mkEnableOption "Enables apps configuration";
  };

  config = lib.mkIf config.custom.apps.enable {
    custom.apps.ghostty.enable = lib.mkDefault true;
  };
}
