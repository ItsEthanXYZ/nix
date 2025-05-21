{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfgZsh = config.programs.zsh.enable;
in {
  imports = [
    ./git.nix
    ./nixvim
    ./programming.nix
    ./tmux.nix
    ./zellij
    ./zk.nix
  ];

  options.custom.cli = {
    enable = mkOption {
      default = true;
      description = "Enables basic cli tools";
      type = types.bool;
    };
  };

  config = mkIf config.custom.cli.enable {
    home.packages = with pkgs; [
      inputs.quill.packages.${pkgs.system}.default
      inputs.sourceweaver.packages.${pkgs.system}.default
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
        enableZshIntegration = mkIf cfgZsh true;
        git = true;
        icons = "auto";
      };
      fzf = {
        enable = true;
        enableZshIntegration = mkIf cfgZsh true;
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
        enableZshIntegration = mkIf cfgZsh true;
      };
      zsh = mkIf cfgZsh {
        shellAliases = {
          cat = "bat";
          cd = "z";
          ls = "eza";
          ll = "eza -lh";
          l = "eza -lah";
          tree = "eza -T";
        };
      };
    };
  };
}
