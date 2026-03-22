{
  description = "Configuración Multiplataforma";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    apple-silicon-support.url = "github:nix-community/nixos-apple-silicon";
    apple-silicon-support.inputs.nixpkgs.follows = "nixpkgs";
    
    # Añade el input de Zen Browser
    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs = inputs@{ nixpkgs, nix-darwin, home-manager, apple-silicon-support, zen-browser, ... }: {
    darwinConfigurations."dam" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/darwin/default.nix
        home-manager.darwinModules.home-manager {
          home-manager.users.dam = import ./home.nix;
        }
      ];
    };

    nixosConfigurations."dam-linux" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        apple-silicon-support.nixosModules.apple-silicon-support
        ./hosts/linux/default.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.dam = import ./home.nix;
        }
        # Puedes añadir el paquete directamente aquí
        {
          environment.systemPackages = [
            zen-browser.packages.aarch64-linux.default
          ];
        }
      ];
    };
  };
}