{
  inputs,
  pkgs,
  config,
  ...
}: {
  home.stateVersion = "23.11";
  imports = [
    ./hyprland
    ./packages
    ./dunst
    ./kitty
    ./waybar
    ./zsh
    ./fuzzel
    ./gtk
    ./direnv
    ./pwnixos-packages
    ./nvim
  ];
}
