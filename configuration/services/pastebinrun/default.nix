# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{pkgs, ...}: {
  imports = [
    ../nginx
    ../postgresql
  ];

  users.users.pastebinrun = {
    isSystemUser = true;
    group = "pastebinrun";
  };

  users.groups.pastebinrun = {};

  services.nginx = {
    virtualHosts = {
      "pastebin.run" = {
        enableACME = true;
        forceSSL = true;
        locations."/".proxyPass = "http://127.0.0.1:8080";
        locations."/assets" = {
          root = "${pkgs.pastebinrun}/dist";
          extraConfig = ''
            expires max;
          '';
        };
        locations."/metrics".return = "403";
      };
      "www.pastebin.run" = {
        enableACME = true;
        forceSSL = true;
        globalRedirect = "pastebin.run";
      };
    };
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = ["pastebinrun"];
    ensureUsers = [
      {
        name = "pastebinrun";
        ensureDBOwnership = true;
      }
    ];
  };

  systemd.services.pastebinrun = {
    wantedBy = ["multi-user.target"];
    requires = ["postgresql.service"];
    after = ["postgresql.service"];
    enable = true;
    environment.ROCKET_DATABASES = ''{main={url="postgresql:///"}}'';
    environment.ROCKET_PORT = "8080";
    environment.SANDBOX_URL = "http://localhost:8082";
    environment.RUST_LOG = "info";
    script = "${pkgs.pastebinrun}/bin/pastebinrun";

    serviceConfig = {
      User = "pastebinrun";
      Restart = "always";
      WorkingDirectory = pkgs.pastebinrun;
    };
  };
}
