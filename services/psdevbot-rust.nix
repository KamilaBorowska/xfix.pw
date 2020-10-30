{
  services.nginx.virtualHosts."showdown.xfix.pw" = {
    enableACME = true;
    forceSSL = true;
    locations."/".proxyPass = "http://127.0.0.1:3030";
  };

  systemd.services.psdevbot-rust = {
    wantedBy = [ "multi-user.target" ];
    enable = true;
    environment = {
      RUST_LOG = "info";
      PSDEVBOT_SERVER = "wss://sim3.psim.us/showdown/websocket";
      PSDEVBOT_USER = "GitHub Staging";
      PSDEVBOT_SECRET = "";
      PSDEVBOT_ROOM = "botdevelopment";
    };
    script = "${import ../packages/psdevbot-rust.nix}/bin/psdevbot-rust";
    serviceConfig = {
      EnvironmentFile = "/var/lib/keys/psdevbot-rust";
      Restart = "always";
    };
  };

  imports = [ ./nginx.nix ];
}
