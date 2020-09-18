with import <nixpkgs> {};

{
  services.openssh = {
    kexAlgorithms = [ "curve25519-sha256@libssh.org" ];
    extraConfig = "AuthenticationMethods publickey";
  };
  services.postgresql.package = pkgs.postgresql_11;
  services.nginx = {
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    sslCiphers = builtins.concatStringsSep ":" [
      "ECDHE-ECDSA-AES128-GCM-SHA256"
      "ECDHE-RSA-AES128-GCM-SHA256"
      "ECDHE-ECDSA-AES256-GCM-SHA384"
      "ECDHE-RSA-AES256-GCM-SHA384"
      "ECDHE-ECDSA-CHACHA20-POLY1305"
      "ECDHE-RSA-CHACHA20-POLY1305"
      "DHE-RSA-AES128-GCM-SHA256"
      "DHE-RSA-AES256-GCM-SHA384"
    ];
    sslDhparam = fetchurl {
      url = "https://ssl-config.mozilla.org/ffdhe2048.txt";
      sha256 = "08dpmhxn8bmmhv7lyd7fxgih2xv4j4xanf5w3pfd0nhqcf2pbxrf";
    };
    appendHttpConfig = ''
      ssl_session_timeout 1d;
      ssl_session_cache shared:MozSSL:10m;
      ssl_session_tickets off;
      ssl_prefer_server_ciphers off;
      ssl_stapling on;
      ssl_stapling_verify on;
      ssl_early_data on;
      add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
      add_header X-Content-Type-Options nosniff always;
    '';
  };
  networking.firewall.allowedTCPPorts = [ 25 80 443 ];
}
