[
  {
    action = "<cmd>nohlsearch<CR>";
    key = "<Esc>";
    mode = "n";
    options = {
      desc = "clear search highlight";
      silent = true;
    };
  }
  {
    action = "<cmd>lua vim.diagnostic.setloclist()<CR>";
    key = "<leader>q";
    mode = "n";
    options = {
      desc = "Open diagnostic [Q]uickfix list";
      silent = true;
    };
  }
  {
    action = "<cmd>lua vim.lsp.buf.rename()<CR>";
    key = "<leader>rn";
    mode = "n";
    options = {
      desc = "[R]e[n]ame symbol";
      silent = true;
    };
  }
  {
    action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
    key = "<leader>ca";
    mode = [
      "n"
      "x"
    ];
    options = {
      desc = "[C]ode [A]ction";
      silent = true;
    };
  }
  {
    action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
    key = "<leader>gD";
    mode = "n";
    options = {
      desc = "[G]o to [d]eclaration";
      silent = true;
    };
  }
  {
    action = "<C-u>";
    key = "<PageUp>";
    mode = [
      "n"
      "i"
      "v"
    ];
    options = {
      remap = true;
      desc = "scroll up";
      silent = true;
    };
  }
  {
    action = "<C-d>";
    key = "<PageDown>";
    mode = [
      "n"
      "i"
      "v"
    ];
    options = {
      remap = true;
      desc = "scroll down";
      silent = true;
    };
  }
  {
    action = "h";
    key = "<Left>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "j";
    key = "<Down>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "k";
    key = "<Up>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "l";
    key = "<Right>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "<C-w>h";
    key = "<C-h>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "<C-w>j";
    key = "<C-j>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "<C-w>k";
    key = "<C-k>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "<C-w>l";
    key = "<C-l>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "<C-w>h";
    key = "<C-Left>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "<C-w>j";
    key = "<C-Down>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "<C-w>k";
    key = "<C-Up>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "<C-w>l";
    key = "<C-Right>";
    options = {
      remap = true;
      silent = true;
    };
  }
  {
    action = "<CMD>Oil<CR>";
    options.desc = "Open parent directory";
    key = "-";
    mode = "n";
  }
  {
    action = "<CMD>lua require('oil').toggle_float()<CR>";
    options.desc = "Open oil in a floating window";
    key = "<leader>-";
    mode = "n";
  }
  {
    action = "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>";
    options.desc = "Create a new note after asking for title";
    key = "<leader>zn";
    mode = "n";
  }
  {
    action = ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>";
    options.desc = "Create a new note with selected text as the title";
    key = "<leader>zn";
    mode = "v";
  }
  {
    action = ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>";
    options.desc = "Create a new note with selected text as the content";
    key = "<leader>zN";
    mode = "v";
  }
  {
    action = "<Cmd>ZkLinks<CR>";
    options.desc = "Open inner links in a floating window";
    key = "<leader>zi";
    mode = "n";
  }
  {
    action = "<Cmd>ZkBacklinks<CR>";
    options.desc = "Open out links in a floating window";
    key = "<leader>zo";
    mode = "n";
  }
]
