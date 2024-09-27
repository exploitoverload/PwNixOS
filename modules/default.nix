{
  inputs,
  pkgs,
  config,
  ...
}: {
  home.stateVersion = "24.05";
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ./hyprland
    ./packages
    ./dunst
    ./kitty
    ./waybar
    ./zsh
    ./fuzzel
    ./gtk
    ./direnv
    ./nvim
  ];
}
