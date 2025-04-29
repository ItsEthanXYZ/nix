{
  enable = true;
  settings = {
    options = {
      component_separators = "";
      section_separators = {
        left = "";
        right = "";
      };
    };
    sections = {
      lualine_a = [
        {
          __unkeyed-1 = "mode";
          separator = {
            left = "";
          };
        }
      ];
      lualine_b = [
        "filename"
        "branch"
      ];
      lualine_c = ["diagnostics"];
      lualine_x = ["%="];
      lualine_y = [
        "filetype"
        "progress"
      ];
      lualine_z = [
        {
          __unkeyed-1 = "location";
          separator = {right = "";};
        }
      ];
    };
    inactive_sections = {
      lualine_a = ["filename"];
      lualine_b = [];
      lualine_c = [];
      lualine_x = [];
      lualine_y = [];
      lualine_z = ["location"];
    };
  };
}
