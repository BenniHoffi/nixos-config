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
    hyprland = {
      url = "github:hyprwm/hyprland";
    };
    tmux-which-key = {
      url = "github:higherorderfunctor/tmux-which-key/feat/adds-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    home-manager,
    hyprland,
    tmux-which-key,
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
      tmux-which-key.overlays.default
    ];
  };
}
