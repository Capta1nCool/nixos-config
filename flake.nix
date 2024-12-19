{
  description = "Capt's nixos system";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      hydra = nixpkgs.lib.nixosSystem {
	specialArgs = {inherit inputs outputs;};
	modules = [
	  ./machines/hydra.nix
	];
      };
    };

    homeConfigurations = {
      "ectos" = home-manager.lib.homeManagerConfiguration {
	pkgs = nixpkgs.legacyPackages."x86_64-linux";
	extraSpecialArgs = {inherit inputs outputs;};
	modules = [
	  ./users/ectos/home-manager.nix # User home manager config
	  inputs.nixvim.homeManagerModules.nixvim	
	];
      };
    };
  };
}
