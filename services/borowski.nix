{
  services.nginx.virtualHosts = {
    "borowski.pw" = {
      useACMEHost = "xfix.pw";
      forceSSL = true;
      globalRedirect = "www.borowski.pw";
    };
    "www.borowski.pw" = {
      useACMEHost = "xfix.pw";
      forceSSL = true;
      root = ./borowski;
    };
  };

  imports = [ ./nginx.nix ];
}
