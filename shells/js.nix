{pkgs}:
pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    bun
    pnpm
    nodePackages.ts-node
    prettierd
  ];
}
