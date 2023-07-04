{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.pwnixos-packages;

in {
    options.modules.pwnixos-packages = { enable = mkEnableOption "pwnixos-packages"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs.nur.repos.exploitoverload; [
          ADCSKiller
          BloodHound
          bloodhound-python
          Responder
          impacket
          polenum
          psudohash
          seclists
        ];
      };
  }
