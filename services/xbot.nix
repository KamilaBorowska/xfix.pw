{
  systemd.services.xbot = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    enable = true;
    environment.SANDBOX_URL = "http://localhost:8082";
    environment.RUST_LOG = "warn";
    script = "${import ../packages/xbot.nix}/bin/xbot";
    serviceConfig = {
      DynamicUser = true;
      EnvironmentFile = "/var/lib/keys/xbot";
    };
  };
}
