{ nginxVirtualHostDefaults }:
  {
    services.nginx = {
      enable = true;
      virtualHosts = nginxVirtualHostDefaults {
        "borowski.pw" = {
          forceSSL = true;
          globalRedirect = "www.borowski.pw";
        };
        "www.borowski.pw" = {
          forceSSL = true;
          root = ./borowski;
        };
      };
    };
  }
