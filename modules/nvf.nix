{ pkgs, ... }:

{
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
                        formatter.conform-nvim.enable = true;

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
                                nvim-cmp.enable = true;
                                blink-cmp.sourcePlugins.ripgrep.enable = true;
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
}
