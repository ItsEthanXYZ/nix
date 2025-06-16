{
  config,
  lib,
  ...
}:
with lib; {
  options.custom.cli.zk = {
    enable = mkOption {
      default = true;
      description = "Enables zk";
      type = types.bool;
    };
  };

  config = mkIf config.custom.cli.zk.enable {
    programs.zk = {
      enable = true;
      settings = {
        notebook.dir = "~/Notebook";
        note = {
          language = "en";
          default-title = "Untitled";
          filename = "{{id}}-{{slug title}}";
        };
      };
    };
  };
}
