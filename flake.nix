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
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
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
  };
}
