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

        statusline.lualine.enable = true;

        formatter.conform-nvim = {
          enable = true;
          setupOpts = {
            formatters_by_ft = {
              javascript = ["prettier"];
              typescript = ["prettier"];
              vue = ["prettier"];
              json = ["prettier"];
              css = ["prettier"];
              html = ["prettier"];
              markdown = ["prettier"];
              nix = ["alejandra"];
            };
          };
        };

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
          grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            vue
          ];
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
          servers = {
            vue_ls = {};
            eslint = {};
            vtsls = {};
          };
        };

        languages = {
          enableTreesitter = true;
          enableFormat = true;

          html.enable = true;
          nix.enable = true;
          rust.enable = true;
          markdown.enable = true;
        };

        autocomplete = {
          blink-cmp.enable = true;
          blink-cmp.sourcePlugins.ripgrep.enable = true;
        };

        filetree = {
          neo-tree = {
            enable = true;
            setupOpts = {
              filesystem = {
                filtered_items = {
                  visible = true;
                  hide_dotfiles = false;
                };
              };
            };
          };
        };

        tabline = {
          nvimBufferline.enable = true;
        };

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        telescope.enable = true;

        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
        };

        extraPackages = with pkgs; [
          vue-language-server
          vtsls
          nodePackages.prettier
          alejandra
        ];

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
          "nvim-ts-autotag" = {
            package = pkgs.vimPlugins.nvim-ts-autotag;
            setupModule = "nvim-ts-autotag";
            setupOpts = {
              filetypes = ["html" "vue"];
            };
          };
        };
      };
    };
  };
}
