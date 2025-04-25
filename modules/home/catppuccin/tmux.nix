{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.catppuccin.enable && config.programs.tmux.enable) {
    programs.tmux.plugins = [
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "${lib.strings.toLower config.catppuccin.flavor}"
          set -g @catppuccin_status_background "none"

          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_text "#W"
          set -g @catppuccin_window_current_text "#W"

          set -g status-left ""
          set -g status-right ""
          set -ag status-right "#{E:@catppuccin_status_session}"
          set -ag status-right "#{E:@catppuccin_status_directory}"
        '';
      }
    ];
  };
}
