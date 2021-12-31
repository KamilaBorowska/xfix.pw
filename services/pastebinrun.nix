let
  pastebinrun = import ../packages/pastebinrun.nix;
in
{
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
    environment.ROCKET_DATABASES = ''{main={url="postgresql:///"}}'';
    environment.ROCKET_PORT = "8080";
    environment.SANDBOX_URL = "http://localhost:8082";
    environment.RUST_LOG = "info";
    script = "${pastebinrun}/bin/pastebinrun";

    serviceConfig = {
      User = "pastebinrun";
      Restart = "always";
      WorkingDirectory = pastebinrun;
    };
  };

  imports = [ ./nginx.nix ];
}
