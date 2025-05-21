{
  config,
  lib,
  ...
}:
with lib; {
  options.custom.cli.zellij = {
    enable = mkOption {
      default = true;
      description = "Enables zellij along with it's corresponding configuration";
      type = types.bool;
    };
  };

  config = mkIf config.custom.cli.zellij.enable {
    home.file.".config/zellij/config.kdl".source = ./config.kdl;

    programs.zellij = {
      enable = true;
    };
  };
}
