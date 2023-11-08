# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  imports = [../nginx];
  services.prometheus = {
    enable = true;
    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [{targets = ["127.0.0.1:9100"];}];
      }
      {
        job_name = "pastebinrun";
        static_configs = [{targets = ["127.0.0.1:8080"];}];
      }
    ];
    exporters.node.enable = true;
  };
  services.grafana = {
    enable = true;
    settings.server = {
      domain = "grafana.xfix.pw";
      root_url = "https://grafana.xfix.pw/";
    };
  };
  services.nginx.virtualHosts."grafana.xfix.pw" = {
    enableACME = true;
    forceSSL = true;
    locations."/".proxyPass = "http://127.0.0.1:3000";
  };
}
