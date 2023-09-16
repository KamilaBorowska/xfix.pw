{
  imports = [../nginx];

  services.nginx = {
    virtualHosts = {
      "i.xfix.pw" = {
        enableACME = true;
        forceSSL = true;
        root = "/var/i.xfix.pw";
      };
    };
  };
}
