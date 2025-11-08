{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./zsh.nix
    ./tmux.nix
    ./z.nix
    ./bun.nix
    ./lazygit.nix
  ];
}
