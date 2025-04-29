{
  conform-nvim = import ./conform.nix;
  cmp = import ./cmp.nix;
  lazy.enable = true;
  lsp = import ./lsp.nix;
  lualine = import ./lualine.nix;
  mini = import ./mini.nix;
  oil = import ./oil.nix;
  snacks = import ./snacks.nix;
  telescope = import ./telescope.nix;
  tmux-navigator.enable = true;
  todo-comments.enable = true;
  treesitter = import ./treesitter.nix;
  which-key = import ./whichkey.nix;
  zk.enable = true;
}
