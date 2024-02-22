{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.fuzzel;
in {
  options.modules.fuzzel = {enable = mkEnableOption "fuzzel";};
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fuzzel
      clipman
      networkmanager_dmenu
    ];
    home.file.".config/fuzzel/fuzzel.ini".source = ./fuzzel.ini;
  };
}
