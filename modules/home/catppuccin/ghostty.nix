{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.catppuccin.enable) {
    programs.ghostty.settings.theme = "catppuccin-${lib.strings.toLower config.catppuccin.flavor}";
  };
}
