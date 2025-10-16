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
        # This is only here to enable history substring search
        oh-my-zsh.enable = true;
        initContent = ''
          # Enables vim mode for zsh
          bindkey -v
          # Autosuggestion completion
          bindkey '^Y' autosuggest-accept
        '';
      };
    };
  };
}
