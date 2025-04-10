{pkgs}:
pkgs.mkShell {
  packages = with pkgs; [
    gcc
    rustup
  ];
}
