{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "www.xfix.pw" = {
        enableACME = true;
        forceSSL = true;
        locations."/api/babelmark/pulldown-cmark".proxyPass = "http://127.0.0.1:8081";
      };
    };
  };

  systemd.services.babelmark = {
    wantedBy = [ "multi-user.target" ];
    enable = true;
    environment.RUST_LOG = "info";
    script = "${import ../packages/babelmark.nix}/bin/pulldown-cmark-babelmark";

    serviceConfig = {
      DynamicUser = true;
      CapabilityBoundingSet = "";
      RestrictAddressFamilies = "AF_INET";
      RestrictNamespaces = true;
      PrivateDevices = true;
      PrivateUsers = true;
      ProtectControlGroups = true;
      ProtectHome = true;
      ProtectKernelModules = true;
      ProtectKernelTunables = true;
      SystemCallArchitectures = "native";
      SystemCallFilter = "@system-service";
      Restart = "always";
    };
  };
}
