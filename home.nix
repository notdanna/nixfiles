{ pkgs, ... }: {
  home.stateVersion = "24.11";

  imports = [
    ./configs/zsh.nix
    ./configs/git.nix
    ./packages/packages.nix
  ];

  programs.home-manager.enable = true;

}
