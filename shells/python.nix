{pkgs}:
pkgs.mkShell {
  packages = with pkgs;
  with pkgs.python3Packages; [
    python
    pandas
    matplotlib
    numpy
    requests
    virtualenv
  ];
}
