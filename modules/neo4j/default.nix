{
  pkgs,
  lib,
  config,
  ...
}:

{
  services.neo4j.enable = true;
  services.neo4j.bolt.listenAddress = "127.0.0.1:7687"; # Local Addresses for http and bolt
  services.neo4j.http.listenAddress = "127.0.0.1:7474";
  services.neo4j.http.enable = true;
  services.neo4j.https.enable = false;
  services.neo4j.bolt.enable = true;
  services.neo4j.bolt.tlsLevel = "DISABLED";

  # This is so that the service is disabled at startup
  systemd.services.neo4j.wantedBy = lib.mkForce []; 
}
