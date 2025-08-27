{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    alacrittyFontsize = lib.mkOption {
      type = lib.types.int;
      default = 12;
      description = "alacritty font size";
    };
  };
  config = {
    programs.alacritty = {
      enable = true;
      theme = "gruvbox_dark";
      settings = {
        window = {
          padding.x = 20;
          padding.y = 20;
          startup_mode = "Maximized";
        };
        font = {
          normal = {
            family = "MartianMono Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "MartianMono Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "MartianMono Nerd Font";
            style = "Italic";
          };
          bold_italic = {
            family = "MartianMono Nerd Font";
            style = "Bold Italic";
          };
          size = config.alacrittyFontsize;
        };
      };
    };
  };
}
