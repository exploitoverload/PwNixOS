{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.gtk;
in {
  options.modules.gtk = {enable = mkEnableOption "gtk";};
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      dconf
      gtk-engine-murrine
      gnome-themes-extra
    ];

    catppuccin = {
      enable = true;
      accent = "mauve";
      flavor = "macchiato";
      pointerCursor.enable = true;
    };

    programs.waybar.catppuccin.enable = false;

    gtk = {
      enable = true;
      catppuccin = {
        enable = true;
        flavor = "macchiato";
        accent = "mauve";
        gnomeShellTheme = true;
        icon = {
          enable = true;
          flavor = "macchiato";
        };
      };
    };
  };
}
