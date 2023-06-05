{ inputs, pkgs, config, ... }:

{
  home.stateVersion = "23.05";
  imports = [
    ./hyprland
    ./packages
    ./dunst 
    ./kitty
    ./waybar
    ./zsh
    ./fuzzel
    ./gtk
  ];
}
