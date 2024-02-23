{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.waydroid;
in {
  options.modules.waydroid = {enable = mkEnableOption "waydroid";};
  config = mkIf cfg.enable {
    virtualisation.waydroid.enable = true;
    programs.adb.enable = true;
  };
}
