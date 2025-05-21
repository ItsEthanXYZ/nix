{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.custom.cli.programming = {
    enable = mkOption {
      default = true;
      description = "Enables cli tools for programming";
      type = types.bool;
    };
  };

  config = mkIf config.custom.cli.programming.enable {
    home.packages = with pkgs; [
      nodejs
      pnpm
      prettierd
      nixd
      nil
      rustc
      cargo
    ];
  };
}
