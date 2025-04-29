{
  config,
  lib,
  ...
}:
with lib; {
  options.custom.shell.zsh = {
    enable = mkOption {
      default = true;
      description = "Enables zsh and its customizations";
      type = types.bool;
    };
  };

  config = lib.mkIf config.custom.shell.zsh.enable {
    programs = {
      zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        # This is only here to make the up arrow key only suggest commands that match the already typed in characters. If there is a better way to do this, I should probably change this.
        oh-my-zsh.enable = true;
        initContent = ''
          # Enables vim mode for zsh
          bindkey -v
        '';
      };
    };
  };
}
