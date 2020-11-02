{
  services.nginx.virtualHosts."showdown.xfix.pw" = {
    enableACME = true;
    forceSSL = true;
    locations."/".proxyPass = "http://127.0.0.1:3030";
  };

  systemd.services.psdevbot-rust = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    enable = true;
    environment = {
      RUST_LOG = "info";
      PSDEVBOT_SERVER = "wss://sim3.psim.us/showdown/websocket";
      PSDEVBOT_USER = "GitHub Staging";
      PSDEVBOT_SECRET = "";
      PSDEVBOT_ROOM = "botdevelopment";
      PSDEVBOT_PROJECT_CONFIGURATION = builtins.toJSON {
        "smogon/pokemon-showdown".rooms = [];
        "smogon/pokemon-showdown-client".rooms = [];
      };
    };
    script = "${import ../packages/psdevbot-rust.nix}/bin/psdevbot-rust";
    serviceConfig = {
      DynamicUser = true;
      EnvironmentFile = "/var/lib/keys/psdevbot-rust";
      Restart = "always";
    };
  };

  imports = [ ./nginx.nix ];
}
