{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [inputs.tmux-which-key.homeManagerModules.default];
  programs.tmux = {
    enable = true;
    sensibleOnTop = true;
    clock24 = true;
    baseIndex = 1;
    mouse = true;
    shortcut = "Space";
    escapeTime = 0;
    terminal = "alacritty";
    keyMode = "vi";
    tmux-which-key.enable = true;
    plugins = with pkgs.tmuxPlugins; [
      gruvbox
      vim-tmux-navigator
      yank
      better-mouse-mode
    ];
    extraConfig = ''
      set-option -sa terminal-overrides ",alacritty:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
    '';
  };
}
