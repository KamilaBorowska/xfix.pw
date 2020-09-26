{ pkgs, ... }:
{
  services.nextcloud = {
    hostName = "nc.xfix.pw";
    nginx.enable = true;
    config = {
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = "/run/postgresql";
      dbname = "nextcloud";
      adminuser = "xfix";
      adminpass = "password";
    };
    package = pkgs.nextcloud18;
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
      enableACME = true;
      forceSSL = true;
    };
  };
  systemd.services."nextcloud-setup" = {
    requires = ["postgresql.service"];
    after = ["postgresql.service"];
  };

  imports = [ ./nginx.nix ];
}
