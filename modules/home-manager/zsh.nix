{
  config,
  pkgs,
  ...
}: 

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "gruvbox-zsh/gruvbox";
      custom = "$HOME/.config/oh-my-zsh/custom";
      plugins = ["git" "z" "fzf" "colored-man-pages"];
    };

    initContent = ''
      ns() { sudo nixos-rebuild switch --flake ~/nixos-config#"$1"; }
      hm() { home-manager switch --flake ~/nixos-config#"$1"; }
    '';

    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "eza -lh --icons --group-directories-first";
      la = "eza -lha --icons --group-directories-first";
      lg = "eza -lha --git --icons --group-directories-first";
      lt = "eza --tree --level=2 --icons --group-directories-first";
      lgt = "eza --tree --level=3 --git --icons --group-directories-first";
      cd = "z";
    };
  };
  home.packages = with pkgs; [
    eza
    fzf
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
  home.file.".config/oh-my-zsh/custom/themes/gruvbox-zsh".source = pkgs.fetchFromGitHub {
    owner = "sbugzu";
    repo = "gruvbox-zsh";
    rev = "c54443c8d3da35037b7ae3ca73b30b45bc91a9e7";
    sha256 = "sha256-pxG2PCw4hAgqu1T9DVjqdHM1t4g32B+N4URmAtoVdsU=";
  };
}
