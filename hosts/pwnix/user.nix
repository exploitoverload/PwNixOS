{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/default.nix
  ];
  config.modules = {
    dunst.enable = true;
    hyprland.enable = true;
    kitty.enable = true;
    packages.enable = true;
    waybar.enable = true;
    zsh.enable = true;
    fuzzel.enable = true;
    gtk.enable = true;
    direnv.enable = true;
    nvim.enable = true;
  };
}
