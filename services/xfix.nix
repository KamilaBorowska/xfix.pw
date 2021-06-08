{
  services.nginx = {
    virtualHosts = {
      "xfix.pw" = {
        useACMEHost = "xfix.pw";
        forceSSL = true;
        locations."/".return = "301 https://www.xfix.pw$request_uri";
      };
      "www.xfix.pw" = {
        useACMEHost = "xfix.pw";
        forceSSL = true;
        root = ./xfix;
      };
    };
  };

  imports = [ ./nginx.nix ];
}
