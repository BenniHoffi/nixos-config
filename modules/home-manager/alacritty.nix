{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    theme = "gruvbox_dark";
    settings = {
      window = {
        padding.x = 20;
        padding.y = 20;
        startup_mode = "Maximized";
      };
    };
  };
}
