{
  systemd.services.xbot = {
    wantedBy = [ "multi-user.target" ];
    enable = true;
    environment.SANDBOX_URL = "http://localhost:8082";
    environment.RUST_LOG = "warn";
    script = "${import ../packages/xbot.nix}/bin/xbot";
    serviceConfig.EnvironmentFile = "/var/lib/keys/xbot";
  };
}
