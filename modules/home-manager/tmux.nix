{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    sensibleOnTop = true;
    clock24 = true;
    baseIndex = 1;
    mouse = true;
    shortcut = "Space";
    escapeTime = 0;
    terminal = "tmux-256color";
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      tmux-which-key
      gruvbox
    ];
    extraConfig = ''
      set-option -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
    '';
  };
}
