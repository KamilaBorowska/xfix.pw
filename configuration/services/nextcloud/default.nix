# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{pkgs, ...}: {
  imports = [
    ../nginx
    ../postgresql
  ];

  services.nextcloud = {
    enable = true;
    hostName = "nc.xfix.pw";
    config = {
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = "/run/postgresql";
      dbname = "nextcloud";
      adminuser = "xfix";
      adminpassFile = toString (pkgs.writeText "password" "password");
    };
    package = pkgs.nextcloud27;
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = ["nextcloud"];
    ensureUsers = [
      {
        name = "nextcloud";
        ensureDBOwnership = true;
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
}
