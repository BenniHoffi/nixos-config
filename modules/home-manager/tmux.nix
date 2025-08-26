{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    sensibleOnTop = true;
    clock24 = true;
    baseIndex = 1;
    mouse = true;
    shortcut = "Space";
    escapeTime = 0;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.tmux-which-key
      tmuxPlugins.gruvbox
    ];
    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set-option -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
    '';
  };
}
