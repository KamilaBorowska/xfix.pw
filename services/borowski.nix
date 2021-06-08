{
  services.nginx.virtualHosts = {
    "borowski.pw" = {
      enableACME = true;
      forceSSL = true;
      globalRedirect = "www.borowski.pw";
    };
    "www.borowski.pw" = {
      enableACME = true;
      forceSSL = true;
      root = ./borowski;
    };
  };

  imports = [ ./nginx.nix ];
}
