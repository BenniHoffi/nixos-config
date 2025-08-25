{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    enableManpages = true;

    settings = {
      vim = {
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        statusline.lualine = {
          enable = true;
          theme = "gruvbox";
        };
        formatter.conform-nvim.enable = true;

        clipboard = {
          enable = true;
          registers = "unnamedplus";
          providers = {
            xclip.enable = true;
          };
        };

        options = {
          tabstop = 4;
          shiftwidth = 0;
          softtabstop = 4;
          autoindent = true;
        };

        keymaps = [
          {
            key = "jk";
            mode = "i";
            silent = true;
            action = "<Esc>";
          }
        ];

        viAlias = false;
        vimAlias = true;

        treesitter = {
          enable = true;
          autotagHtml = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
        };

        languages = {
          enableTreesitter = true;
          enableFormat = true;

          ts.enable = true;
          html.enable = true;
          nix.enable = true;
          rust.enable = true;
        };

        autocomplete = {
          blink-cmp.enable = true;
          blink-cmp.sourcePlugins.ripgrep.enable = true;
        };

        filetree = {
          neo-tree.enable = true;
        };

        tabline = {
          nvimBufferline.enable = true;
        };

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        telescope.enable = true;
        lazy.plugins = {
          "autoclose.nvim" = {
            package = pkgs.vimPlugins.autoclose-nvim;
            setupModule = "autoclose";
          };
        };
      };
    };
  };
}
