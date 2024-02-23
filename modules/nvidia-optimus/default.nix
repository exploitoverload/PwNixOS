{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.nvidia-optimus;
in {
  options.modules.nvidia-optimus = {enable = mkEnableOption "nvidia-optimus";};
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      libva-utils
      cudatoolkit
    ];

    hardware.nvidia.prime = {
      offload.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
      sync.enable = true;
    };
    hardware.nvidia.nvidiaSettings = true;
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.nvidiaPersistenced = true;
    hardware.nvidia.powerManagement = {
      enable = true;
      finegrained = true;
    };
  };
}
