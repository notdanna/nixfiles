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
    swaybg
    spotify-player
    playerctl

    fuzzel
    foot
    obsidian
    (vscode.override {
      commandLineArgs = [
        "--ozone-platform=wayland"
        "--disable-gpu-sandbox"
      ];
    })

  ];
}
