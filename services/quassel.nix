{
  users.users.quassel.extraGroups = ["nginx"];
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
  systemd.services.quassel.after = [ "network-online.target" ];
  networking.firewall.allowedTCPPorts = [ 4242 ];
}
