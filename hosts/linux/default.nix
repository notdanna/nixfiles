{ pkgs, ... }: {
  imports = [
  ];

  nixpkgs.hostPlatform = "x86_64-linux"; 
  
  users.users.dam = {
    isNormalUser = true;
    home = "/home/dam";
    extraGroups = [ "wheel" ];
  };

  # La base del sistema se mantiene igual que en macOS
  nix.settings.experimental-features = "nix-command flakes";
  environment.systemPackages = with pkgs; [ git vim curl ];
  programs.zsh.enable = true;
  
  system.stateVersion = "24.11"; 
}