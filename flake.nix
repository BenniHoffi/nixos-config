{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    niri,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          nvf.nixosModules.default
          ./hosts/desktop/configuration.nix
          ./modules/nixos/nvf.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      macbook = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          nvf.nixosModules.default
          ./hosts/macbook-nixos/configuration.nix
          ./modules/nixos/nvf.nix
          ./modules/nixos/niri.nix
          home-manager.nixosModules.default
          niri.nixosModules.niri
        ];
      };
    };
    homeConfigurations = {
      macbook = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
        };
        modules = [
          nvf.homeManagerModules.default
          ./hosts/macbook/home.nix
          ./modules/nixos/nvf.nix
        ];
      };
    };
    nixpkgs.overlays = [inputs.niri.overlays];
  };
}
