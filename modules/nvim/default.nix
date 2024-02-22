{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.nvim;
in {
  options.modules.nvim = {enable = mkEnableOption "nvim";};
  config = mkIf cfg.enable {
    home.file.".config/nvim" = {
      source = ./config;
      recursive = true;
    };
    home.file.".npmrc".source = ./npmrc;
  };
}
