{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    itsEthan.cli.builtin.enable = lib.mkEnableOption "Enables basic cli tools and modern replacements for common commands";
  };

  config = lib.mkIf config.itsEthan.cli.builtin.enable {
    home.packages = with pkgs; [
      unzip
      zip
      tlrc
      neofetch
      ripgrep
      fd
    ];

    programs = {
    bat.enable = true;
    eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = "auto";
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
      fileWidgetOptions = [
        "-i"
        "-e"
      ];
      historyWidgetOptions = [
        "-i"
        "-e"
      ];
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      shellAliases = {
        cat = "bat";
        cd = "z";
        ls = "eza --icons=always";
        ll = "eza -lh";
        l = "eza -lah";
        tree = "eza -T";
      };
    };
    };
  };
}
