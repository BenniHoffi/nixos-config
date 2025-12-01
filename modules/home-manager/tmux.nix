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
      resurrect
    ];
    extraConfig = ''
      set-option -sa terminal-overrides ",alacritty:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
      resurrect_dir="$HOME/.tmux/resurrect"
      set -g @resurrect-dir $resurrect_dir
      set -g @resurrect-hook-post-save-all 'target=$(readlink -f $resurrect_dir/last); sed "s| --cmd .*-vim-pack-dir||g; s|/etc/profiles/per-user/$USER/bin/||g; s|/home/$USER/.nix-profile/bin/||g" $target | sponge $target'

    '';
  };
}
