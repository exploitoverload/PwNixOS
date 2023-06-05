{ config, pkgs, ... }:

{
	imports = [
		../../modules/nvidia-optimus/default.nix # Choose nvidia-optimus/intel (AMD is WiP). Only laptops, i know.
    # ../../modules/intel/default.nix
	];
}
