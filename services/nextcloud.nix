{ pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    hostName = "nc.xfix.pw";
    config = {
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = "/run/postgresql";
      dbname = "nextcloud";
      adminuser = "xfix";
      adminpass = "password";
    };
    package = pkgs.nextcloud21;
  };
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "nextcloud" ];
    ensureUsers = [
      {
        name = "nextcloud";
        ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
      }
    ];
  };
  services.nginx.virtualHosts = {
    "nc.xfix.pw" = {
      useACMEHost = "xfix.pw";
      forceSSL = true;
    };
  };
  systemd.services."nextcloud-setup" = {
    requires = ["postgresql.service"];
    after = ["postgresql.service"];
  };

  imports = [ ./nginx.nix ];
}
