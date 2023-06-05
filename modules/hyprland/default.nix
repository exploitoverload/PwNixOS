{ lib, config, pkgs, ... }:

with lib;
let cfg = config.modules.hyprland;

in {
  options.modules.hyprland = { enable = mkEnableOption "hyprland"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprpaper hyprland wl-clipboard hyprland-protocols hyprland-share-picker wlogout swayidle
    ];

    home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
    home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
    home.file.".config/hypr/wallpaper.png".source = ../../pics/wallpaper.png;
    home.file.".config/hypr/nix-black-4k.png".source = ../../pics/nix-black-4k.png;
  };
}
