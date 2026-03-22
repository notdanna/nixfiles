{ pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
  ];


  nixpkgs.hostPlatform = "aarch64-linux"; 
  nixpkgs.config.allowUnfree = true; 

  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ]; 

  users.users.dam = {
    isNormalUser = true;
    home = "/home/dam";
    extraGroups = [ "wheel" "networkmanager" "audio" ];
  };

  environment.sessionVariables = {
    # Fuerza a VS Code y Electron a usar Wayland
    NIXOS_OZONE_WL = "1";
    # Opcional: si tienes problemas de renderizado, puedes probar esto:
    # MOZ_ENABLE_WAYLAND = "1";
  };

  hardware.asahi = {
    setupAsahiSound = true;
    peripheralFirmwareDirectory = ./firmware;
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.kernelParams = [ "appledrm.show_notch=1" ];

  # La base del sistema se mantiene igual que en macOS
  nix.settings.experimental-features = "nix-command flakes";
  environment.systemPackages = with pkgs; [ git neovim curl brightnessctl waybar ];
  programs.zsh.enable = true;
  programs.niri.enable = true;

  system.stateVersion = "24.11"; 
}
