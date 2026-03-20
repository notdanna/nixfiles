{ pkgs, ... }: {
  home.username = "dam";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/dam" else "/home/dam";
  
  home.stateVersion = "24.11"; #

  imports = [
    # Asegúrate de que estas rutas apunten a donde moviste tus archivos comunes
    ./modules/common/zsh.nix
    ./modules/common/git.nix
    ./modules/common/packages.nix
  ];

  programs.home-manager.enable = true; #
}