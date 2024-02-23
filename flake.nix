{
  description = "Pwnix: NixOS Dotfiles focused on Hacking and Productivity.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    hypr-contrib.url = "github:hyprwm/contrib";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nur,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;

    # ---CUSTOM SETTINGS---

    user = "d3fault"; # Change this to set the main user.
    hostName = "pwnix"; # Change this to set the hostname of the machine.

    # ---CUSTOM SETTINGS---

    mkSystem = pkgs: system: hostname:
      pkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./modules/system/configuration.nix
          (./. + "/hosts/${hostname}/hardware-configuration.nix")
          (./. + "/hosts/${hostname}/default.nix") # For additional configuration read this file (nvidia, intel, ...).
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              extraSpecialArgs = {inherit inputs user;};
              users.${user} = ./. + "/hosts/${hostname}/user.nix";
            };
            nixpkgs.overlays = [
              nur.overlay
            ];
          }
        ];
        specialArgs = {inherit inputs user hostName;};
      };
  in {
    nixosConfigurations = {
      pwnix = mkSystem inputs.nixpkgs "x86_64-linux" "pwnix";
    };
  };
}
