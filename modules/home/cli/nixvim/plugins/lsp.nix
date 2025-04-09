{
  enable = true;
  luaConfig.post = ''
    local border = "rounded"

    -- Configure borders for LSP hover and signature help
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, { border = border }
    )
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, { border = border }
    )

    -- Configure borders for diagnostics float
    vim.diagnostic.config({
      float = { border = border },
      virtual_text = true,
      signs = true,
      underline = false,
      update_in_insert = false,
      severity_sort = true,
    })
  '';
  servers = {
    cssls.enable = true;
    eslint.enable = true;
    jdtls.enable = true;
    jsonnet_ls.enable = true;
    lua_ls.enable = true;
    marksman.enable = true;
    nixd = {
      enable = true;
      settings = {
        nixpkgs.expr = "import <nixpkgs> { }";
      };
    };
    pyright.enable = true;
    rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
    };
    texlab.enable = true;
    ts_ls.enable = true;
  };
}
