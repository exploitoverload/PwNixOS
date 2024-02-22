{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.hyprland;
in {
  options.modules.hyprland = {enable = mkEnableOption "hyprland";};
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprpaper
      hyprland
      wl-clipboard
      hyprland-protocols
      wlogout
      swayidle
    ];

    home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
    home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
    home.file.".config/hypr/wallpaper.png".source = ../../pics/wallpaper.png;
    home.file.".config/hypr/PwNixOS-Wallpaper.png".source = ../../pics/PwNixOS-Wallpaper.png;
  };
}
