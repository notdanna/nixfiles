{
  description = "Configuración Multiplataforma";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, nix-darwin, home-manager, ... }: {
    # Salida para macOS
    darwinConfigurations."dam" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/darwin/default.nix
        home-manager.darwinModules.home-manager {
          home-manager.users.dam = import ./home.nix;
        }
      ];
    };

    # Salida para Linux (NixOS)
    nixosConfigurations."dam-linux" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/linux/default.nix
        home-manager.nixosModules.home-manager {
          home-manager.users.dam = import ./home.nix;
        }
      ];
    };
  };
}