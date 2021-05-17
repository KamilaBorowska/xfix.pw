{
  services.prometheus = {
    enable = true;
    scrapeConfigs = [{
      job_name = "node";
      static_configs = [{ targets = [ "127.0.0.1:9100" ]; }];
    }];
    exporters.node.enable = true;
  };
  services.grafana = {
    enable = true;
    domain = "grafana.xfix.pw";
    rootUrl = "https://grafana.xfix.pw/";
  };
  services.nginx.virtualHosts."grafana.xfix.pw" = {
    enableACME = true;
    forceSSL = true;
    locations."/".proxyPass = "http://127.0.0.1:3000";
  };
  imports = [ ./nginx.nix ];
}
