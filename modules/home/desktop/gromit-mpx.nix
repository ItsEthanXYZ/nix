{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.custom.desktop.gromit-mpx = {
    enable = mkOption {
      default = false;
      description = "Enables the gromit-mpx annotation tool";
      type = types.bool;
    };
  };

  config = mkIf config.custom.desktop.gromit-mpx.enable {
    home.packages = with pkgs; [gromit-mpx];

    home.file = {
      ".config/gromit-mpx.cfg".text = ''
        "smooth line" = SMOOTH (color = "red" simplify=10 snap=30);
        "ortho line" = ORTHOGONAL (color = "red" size=5 simplify=15 radius=20 minlen=50 snap=40);

        "Eraser" = ERASER (size = 75);
        "default" = "smooth line";
        "default"[SHIFT] = "ortho line";
        "default"[Button3] = "Eraser";
      '';
    };

    wayland.windowManager.hyprland = mkIf (config.wayland.windowManager.hyprland.enable) {
      settings = {
        "decoration:dim_special" = 0;
        bind = [
          "SUPER_SHIFT, g, togglespecialworkspace, gromit"
        ];
        windowrulev2 = [
          "noblur, class:^(Gromit-mpx)$"
          "noshadow, class:^(Gromit-mpx)$"
          "noanim, class:^(Gromit-mpx)$"
          "size 100% 100%, class:^(Gromit-mpx)$"
          "move 0 0, class:^(Gromit-mpx)$"
        ];
        workspace = [
          "special:gromit, gapsin:0, gapsout:0, on-created-empty:gromit-mpx -a"
        ];
      };
    };
  };
}
