{
  config,
  lib,
  ...
}:
{
  options = {
    itsEthan.shell.zsh.enable = lib.mkEnableOption "Enables zsh and custom configuration";
  };

  config = lib.mkIf config.itsEthan.shell.zsh.enable {
    programs = {
      zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        oh-my-zsh = {
          enable = true;
          plugins = [
            "vi-mode"
          ];
        };
        initContent = ''
          # Autosuggestion completion
          bindkey '^Y' autosuggest-accept
        '';
      };
    };
  };
}
