{ pkgs, ... }: {
  home.packages = with pkgs; [
    fd
    fzf
    bat
    eza
    fastfetch
    btop
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
