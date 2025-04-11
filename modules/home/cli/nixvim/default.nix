{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
with lib; {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options = {
    custom.cli.nixvim = {
      enable = mkOption {
        default = true;
        description = "Enables the neovim distribution nixvim";
        type = types.bool;
      };
    };
  };

  config = mkIf config.custom.cli.nixvim.enable {
    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    programs.nixvim = {
      enable = true;
      globals.mapleader = " ";
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      opts = import ./opts.nix;
      autoCmd = import ./autocmds.nix;
      keymaps = import ./keymaps.nix;
      plugins = import ./plugins;
      extraPlugins = [
        {
          plugin = pkgs.vimPlugins.supermaven-nvim;
          config = "lua require(\"supermaven-nvim\").setup({disable_keymaps = true,disable_inline_completion = true,});";
        }
      ];
    };

    home.packages = with pkgs; [
      black
      google-java-format
      nixfmt-rfc-style
      prettierd
      rustfmt
      alejandra
    ];

    home.file.".config/nvim/snippets" = {
      source = ./snippets;
      recursive = true;
    };
  };
}
