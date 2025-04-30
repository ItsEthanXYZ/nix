{
  enable = true;
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
