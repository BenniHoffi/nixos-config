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
          tabstop = 2;
          shiftwidth = 0;
          softtabstop = 2;
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

        extraPlugins = {
          vim-tmux-navigator = {
            package = pkgs.vimPlugins.vim-tmux-navigator;
          };
        };

        lazy.plugins = {
          "autoclose.nvim" = {
            package = pkgs.vimPlugins.autoclose-nvim;
            setupModule = "autoclose";
          };
          #          "vim-tmux-navigator" = {
          #            package = pkgs.vimPlugins.vim-tmux-navigator;
          #            cmd = [
          #              "TmuxNavigateLeft"
          #              "TmuxNavigateDown"
          #              "TmuxNavigateUp"
          #              "TmuxNavigateRight"
          #              "TmuxNavigatePrevious"
          #              "TmuxNavigatorProcessList"
          #            ];
          #            keys = [
          #              {
          #                key = "<c-h>";
          #                action = "<cmd><C-U>TmuxNavigateLeft<cr>";
          #              }
          #              {
          #                key = "<c-j>";
          #                action = "<cmd><C-U>TmuxNavigateDown<cr>";
          #              }
          #              {
          #                key = "<c-k>";
          #                action = "<cmd><C-U>TmuxNavigateUp<cr>";
          #              }
          #              {
          #                key = "<c-l>";
          #                action = "<cmd><C-U>TmuxNavigateRight<cr>";
          #              }
          #              {
          #                key = "<c-\\>";
          #                action = "<cmd><C-U>TmuxNavigatePrevious<cr>";
          #              }
          #            ];
          #          };
        };
      };
    };
  };
}
