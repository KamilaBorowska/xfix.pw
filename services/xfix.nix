{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "xfix.pw" = {
        enableACME = true;
        forceSSL = true;
        globalRedirect = "www.xfix.pw";
      };
      "www.xfix.pw" = {
        enableACME = true;
        forceSSL = true;
        root = ./xfix;
      };
    };
  };
}
