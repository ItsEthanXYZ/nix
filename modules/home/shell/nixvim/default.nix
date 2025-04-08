{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options = {
    custom.shell.nixvim.enable = lib.mkEnableOption "Enables the neovim distribution nixvim";
  };

  config = lib.mkIf config.custom.shell.nixvim.enable {
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
