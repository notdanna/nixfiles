{ pkgs, ... }: {

  imports = [
    ./packages/homebrew.nix
    ./services/yabai.nix
    ./services/skhd.nix
  ];
  
  system.primaryUser = "dam";
  nix.enable = false;
  nix.settings.experimental-features = "nix-command flakes";

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
  ];

  programs.zsh.enable = true;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.dam = {
    name = "dam";
    home = "/Users/dam";
  };

  system.stateVersion = 5;
}
