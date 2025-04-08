{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  isDarwin = pkgs.stdenv.isDarwin;
  ghostty-mock = pkgs.writeShellScriptBin "ghostty-mock" "";
in {
  options.custom.apps.ghostty = {
    enable = mkOption {
      default = false;
      description = "Enables the terminal emulator ghostty and the configuration";
      type = types.bool;
    };
  };

  config = lib.mkIf config.custom.apps.ghostty.enable {
    programs.ghostty = {
      enable = true;
      package = lib.mkIf isDarwin ghostty-mock;
      enableZshIntegration = mkIf config.programs.zsh.enable true;
      installBatSyntax = mkIf config.programs.bat.enable true;
      settings = {
        clipboard-read = "allow";
        clipboard-write = "allow";
        confirm-close-surface = false;
        font-size = 16;
        macos-titlebar-style = "hidden";
        window-decoration = "auto";
        window-padding-x = 8;
        window-padding-y = 8;

        keybind = [
          "shift+ctrl+plus=increase_font_size:1"
          "ctrl+minus=decrease_font_size:1"
          "ctrl+0=reset_font_size"
        ];
      };
    };
  };
}
