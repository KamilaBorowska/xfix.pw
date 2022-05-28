{
  security.acme.certs."xfix.pw" = {
    allowKeysForGroup = true;
    group = "quassel";
  };
  services.quassel = {
    certificateFile = "/var/lib/acme/xfix.pw/full.pem";
    enable = true;
    interfaces = ["0.0.0.0"];
    requireSSL = true;
  };
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "quassel" ];
    ensureUsers = [
      {
        name = "quassel";
        ensurePermissions."DATABASE quassel" = "ALL PRIVILEGES";
      }
    ];
  };
  networking.firewall.allowedTCPPorts = [ 4242 ];
}
