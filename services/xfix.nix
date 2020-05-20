{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "xfix.pw" = {
        enableACME = true;
        forceSSL = true;
        locations."/".return = "301 https://www.xfix.pw$request_uri";
      };
      "www.xfix.pw" = {
        enableACME = true;
        forceSSL = true;
        root = ./xfix;
      };
    };
  };
}
