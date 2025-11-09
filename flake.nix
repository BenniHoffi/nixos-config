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
      inputs.nixpkgs.follows = "nixpkgs";
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
          home-manager.nixosModules.default
        ];
      };
      macbook = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.nixosModules.home-manager
          niri.nixosModules.niri
          nvf.nixosModules.default
          ./hosts/macbook-nixos/configuration.nix
          ./modules/nixos/nvf.nix
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
    nixpkgs.overlays = [
      niri.overlays.niri
    ];
  };
}
