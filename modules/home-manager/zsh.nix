{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      them = "gruvbox";
      plugins = ["git" "z" "fzf" "colored-man-pages"];
    };

    sessionVariables = {
      SOLARIZED_THEME = "dark";
    };

    initExtra = ''
      ns() { sudo nixos-rebuild switch --flake ~/nixos-config#"$1"; }
      hm() { home-manager switch --flake ~/nix-config#"$1"; }
    '';

    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "eza -lh --icons --group-directories-first";
      la = "eza -lha --icons --group-directories-first";
      lg = "eza -lha --git --icons --group-directories-first";
      lt = "eza --tree --level=2 --icons --group-directories-first";
      lgt = "eza --tree --level=3 --git --icons --group-directories-first";
    };
    home.packages = with pkgs; [
      eza
      fzf
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];

    # Provide the Gruvbox Zsh theme to Oh My Zsh
    home.file.".oh-my-zsh/custom/themes/gruvbox.zsh-theme".source =
      pkgs.fetchFromGitHub {
        owner = "sbugzu";
        repo = "gruvbox-zsh";
        rev = "master";
        sha256 = "sha256-1ibn2pd04rj4w66izn1pi2vkawvlx9c0vzalpcm0i11q5hybc4d7";
      }
      + "/gruvbox.zsh-theme";
  };
}
