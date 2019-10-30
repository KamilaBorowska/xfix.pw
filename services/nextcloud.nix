{ nginxVirtualHostDefaults }:
  {
    services.nextcloud = {
      enable = true;
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
    services.nginx.virtualHosts = nginxVirtualHostDefaults {
      "nc.xfix.pw".forceSSL = true;
    };
    systemd.services."nextcloud-setup" = {
      requires = ["postgresql.service"];
      after = ["postgresql.service"];
    };
  }
