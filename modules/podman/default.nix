{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.podman;
in {
  options.modules.podman = {enable = mkEnableOption "podman";};
  config = mkIf cfg.enable {
    virtualisation = {
      podman = {
        enable = true;

        dockerCompat = true;

        defaultNetwork.settings.dns_enabled = true;
      };
    };
  };
}
