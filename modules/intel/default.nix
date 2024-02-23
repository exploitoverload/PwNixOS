{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.intel;
in {
  options.modules.intel = {enable = mkEnableOption "intel";};
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      libva-utils
    ];

    hardware.opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        intel-compute-runtime
      ];
    };
  };
}
