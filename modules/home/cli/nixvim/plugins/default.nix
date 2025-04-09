{
  avante = import ./avante.nix;
  conform-nvim = import ./conform.nix;
  cmp = import ./cmp.nix;
  indent-blankline.enable = true;
  lsp = import ./lsp.nix;
  lualine = import ./lualine.nix;
  mini = import ./mini.nix;
  noice.enable = true;
  oil = import ./oil.nix;
  sleuth.enable = true;
  telescope = import ./telescope.nix;
  todo-comments.enable = true;
  treesitter = import ./treesitter.nix;
  which-key = import ./whichkey.nix;
}
