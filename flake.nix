{
  description = "Pwnix: NixOS Dotfiles focused on Hacking and Productivity.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05"; # In order to fix stability issues in packages or options.
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix"; # For theming.
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixpkgs-stable,
    catppuccin,
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
        inherit system;
        modules = [
          ./modules/system/configuration.nix
          (./. + "/hosts/${hostname}/hardware-configuration.nix")
          (./. + "/hosts/${hostname}/default.nix") # For additional configuration read this file (nvidia, intel, ...).
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              extraSpecialArgs = {
                inherit inputs user;
                stable = import nixpkgs-stable {
                  inherit system;
                  config.allowUnFree = true;
                };
              };
              users.${user} = ./. + "/hosts/${hostname}/user.nix";
            };
          }
        ];
        specialArgs = {
          inherit inputs user hostName;
          stable = import nixpkgs-stable {
            inherit system;
            config.allowUnFree = true;
          };
        };
      };
  in {
    nixosConfigurations = {
      pwnix = mkSystem inputs.nixpkgs "x86_64-linux" "pwnix";
    };
  };
}
