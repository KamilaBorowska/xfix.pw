{ nginxVirtualHostDefaults }:
  {
    services.nginx = {
      enable = true;
      virtualHosts = nginxVirtualHostDefaults {
        "xfix.pw" = {
          forceSSL = true;
          globalRedirect = "www.xfix.pw";
        };
        "www.xfix.pw" = {
          forceSSL = true;
          root = ./xfix;
        };
      };
    };
  }
