{
  config,
  lib,
  ...
}:
with lib; {
  imports = [
    ./git.nix
    ./nixvim
    ./tmux.nix
  ];

  options.custom.cli = {
    enable = mkOption {
      default = true;
      description = "Enables basic cli tools";
      type = types.bool;
    };
  };

  config = mkIf config.custom.cli.enable {
    home.packages = [
      inputs.sourceweaver.packages.${pkgs.system}.default
    ];

    programs = {
      bat.enable = true;
      eza = {
        enable = true;
        enableZshIntegration = lib.mkIf config.programs.zsh.enable true;
        git = true;
        icons = "auto";
      };
      fzf = {
        enable = true;
        enableZshIntegration = lib.mkIf config.programs.zsh.enable true;
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
        enableZshIntegration = lib.mkIf config.programs.zsh.enable true;
      };
      zsh = lib.mkIf config.programs.zsh.enable {
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
