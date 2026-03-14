{ pkgs, ... }: {
  home.packages = with pkgs; [
    fd
    fzf
    bat
    eza
    fastfetch
    htop
    jq
    neovim
    ranger
    ripgrep
    starship
    tmux
    tree
    zoxide
  ];
}