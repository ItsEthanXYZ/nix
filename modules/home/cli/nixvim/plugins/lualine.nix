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
            right = "";
          };
        }
      ];
      lualine_b = [
        "filename"
      ];
      lualine_c = [
        "branch"
        {
          __unkeyed-2 = "diagnostics";
          color.bg = "#ff0000";
        }
      ];
      lualine_x = [
        {
          __unkeyed-1 = "progress";
          colored = false;
        }
      ];
      lualine_y = [
        "filetype"
      ];
      lualine_z = [
        {
          __unkeyed-1 = "location";
          separator = {
            left = "";
            right = "";
          };
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
