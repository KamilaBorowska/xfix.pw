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
    package = pkgs.nextcloud20.overrideAttrs(_: rec {
      version = "20.0.1";
      src = pkgs.fetchurl {
        url = "https://download.nextcloud.com/server/releases/nextcloud-${version}.tar.bz2";
        sha256 = "1z1fzz1i41k4dhdhi005l3gzkvnmmgqqz3rdr374cvk73q7bbiln";
      };
    });
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
