{ pkgs, ... }:
{
    virtualisation = {
        podman = {
            enable = true;

            dockerCompat = true;

            defaultNetwork.dnsname.enable = true;
          };
      };
  }
