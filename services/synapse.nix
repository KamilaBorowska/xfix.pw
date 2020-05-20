{ pkgs, ... }:
{
  services.nginx = {
    enable = true;

    virtualHosts."xfix.pw" = {
      enableACME = true;
      forceSSL = true;
      locations = {
        "/_matrix".proxyPass = "http://[::1]:8008";
        "= /.well-known/matrix/server".extraConfig = ''
          add_header Content-Type application/json;
          add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
          add_header X-Content-Type-Options nosniff always;
          return 200 '{"m.server":"xfix.pw:443"}';
        '';
        "= /.well-known/matrix/client".extraConfig = ''
          add_header Content-Type application/json;
          add_header Access-Control-Allow-Origin *;
          add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
          add_header X-Content-Type-Options nosniff always;
          return 200 '{"m.homeserver":{"base_url":"https://xfix.pw"},"m.identity_server":{"base_url":"https://vector.im"}}';
        '';
      };
    };
  };

  services.matrix-synapse = {
    enable = true;
    server_name = "xfix.pw";
    listeners = [
      {
        port = 8008;
        bind_address = "::1";
        type = "http";
        tls = false;
        x_forwarded = true;
        resources = [
          {
            names = [ "client" "federation" ];
            compress = false;
          }
        ];
      }
    ];
    #registration_shared_secret = "aMnNBePjPwfexSurlzz0YL1tmMRwZzNd9dCfxrC15vQ6FnOqEOScNffxc6k5LfsT";# TODO REMOVE
  };

  services.postgresql.enable = true;
  services.postgresql.initialScript = pkgs.writeText "synapse-init.sql" ''
    CREATE ROLE "matrix-synapse" WITH LOGIN PASSWORD 'synapse';
    CREATE DATABASE "matrix-synapse" WITH OWNER "matrix-synapse"
      TEMPLATE template0
      LC_COLLATE = "C"
      LC_CTYPE = "C";
  '';
}