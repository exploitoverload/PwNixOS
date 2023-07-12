{ config, pkgs, ... }:

{
	imports = [
    ../../modules/intel/default.nix # Default to intel graphics
		# ../../modules/nvidia-optimus/default.nix # Enable this if you happen to have a nvidia optimus laptop
    ../../modules/podman/default.nix # Enable Podman
    ../../modules/neo4j/default.nix # Enable Neo4j
	];
}
