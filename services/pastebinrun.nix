let
  pastebinrun = import ../packages/pastebinrun.nix;
in
{
  services.nginx = {
    virtualHosts = {
      "pastebin.run" = {
        enableACME = true;
        forceSSL = true;
        locations."/".proxyPass = "http://127.0.0.1:8080";
        locations."/static".root = pastebinrun;
        locations."/static/js" = {
          root = pastebinrun;
        };
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
    environment.SANDBOX_URL = "http://localhost:8082";
    environment.RUST_LOG = "info";
    script = "${pastebinrun}/bin/pastebinrun";

    serviceConfig = {
      DynamicUser = true;
      Restart = "always";
      WorkingDirectory = pastebinrun;
    };
  };

  imports = [ ./nginx.nix ];
}
