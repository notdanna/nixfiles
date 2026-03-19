{ pkgs, ... }: {
  home.stateVersion = "24.11";

  imports = [
    ./modules/configs/zsh.nix
    ./modules/configs/git.nix
    ./modules/packages/packages.nix
  ];

  programs.home-manager.enable = true;

}
