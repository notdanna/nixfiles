{ pkgs, ... }: {
  imports = [
    ../../modules/darwin/homebrew.nix
    ../../modules/darwin/yabai.nix
    ../../modules/darwin/skhd.nix
  ];

  system.primaryUser = "dam";
  nixpkgs.hostPlatform = "aarch64-darwin";
  
  users.users.dam = {
    name = "dam";
    home = "/Users/dam";
  };

  nix.settings.experimental-features = "nix-command flakes";

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
  ];

  programs.zsh.enable = true;
  system.stateVersion = 5;
}