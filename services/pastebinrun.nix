{ nginxVirtualHostDefaults }:
  let
    pastebinrun = import ../packages/pastebinrun.nix;
  in
  {
    users.users.pastebinrun.isSystemUser = true;

    services.nginx = {
      enable = true;
      virtualHosts = nginxVirtualHostDefaults {
        "pastebin.run" = {
          forceSSL = true;
          locations."/".proxyPass = "http://127.0.0.1:8080";
          locations."/static".root = pastebinrun;
        };
        "www.pastebin.run" = {
          forceSSL = true;
          globalRedirect = "pastebin.run";
        };
      };
    };

    services.postgresql = {
      enable = true;
      ensureDatabases = [ "pastebinrun" ];
      ensureUsers = [
        {
          name = "pastebinrun";
          ensurePermissions."DATABASE pastebinrun" = "ALL PRIVILEGES";
        }
      ];
    };

    systemd.services.pastebinrun = {
      wantedBy = [ "multi-user.target" ];
      requires = ["postgresql.service"];
      after = ["postgresql.service"];
      enable = true;
      environment.DATABASE_URL = "postgresql:///";
      environment.SANDBOX_URL = "http://sandbox.pastebin.run:8888";
      environment.RUST_LOG = "info";
      script = "${pastebinrun}/bin/pastebinrun";

      serviceConfig = {
        User = "pastebinrun";
        Restart = "always";
        WorkingDirectory = pastebinrun;
      };
    };
  }
