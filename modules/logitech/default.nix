{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.logitech;
in {
  options.modules.logitech = {enable = mkEnableOption "logitech";};
  config = mkIf cfg.enable {
    hardware.logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };
  };
}
