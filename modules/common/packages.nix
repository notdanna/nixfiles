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
    tmux
    tree
    zoxide
    foot
    swaybg
    spotify-player
    playerctl


    alacritty
    firefox
    fuzzel
    (vscode.override {
      commandLineArgs = [
        "--ozone-platform=wayland"
        "--disable-gpu-sandbox"
      ];
    })

  ];
}
