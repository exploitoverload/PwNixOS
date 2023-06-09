{ lib, config, pkgs, ... }:

with lib;
let cfg = config.modules.gtk;

in {
  options.modules.gtk = { enable = mkEnableOption "gtk"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      dconf gtk-engine-murrine gnome.gnome-themes-extra gtk3
    ];
    home.sessionVariables.GTK_THEME = "Catppuccin-Macchiato-Compact-Mauve-dark";
    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Macchiato-Compact-Mauve-dark";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "mauve" ];
          size = "compact";
          tweaks = [ ];
          variant = "macchiato";
        };
      };
      cursorTheme = {
        name = "Catppuccin-Macchiato-Mauve-Cursors";
        package = pkgs.catppuccin-cursors.macchiatoMauve;
      };
      iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.catppuccin-papirus-folders;
        };
    };
  };
}
