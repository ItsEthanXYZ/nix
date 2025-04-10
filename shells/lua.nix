{pkgs}:
pkgs.mkShell {
  packages = with pkgs; [
    lua
    luarocks
    luaformatter
  ];
}
