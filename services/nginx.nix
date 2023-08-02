{ pkgs, ... }:
{
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    sslCiphers = null;
    sslProtocols = "TLSv1.3";
    appendHttpConfig = ''
      ssl_session_timeout 1d;
      ssl_session_cache shared:MozSSL:10m;
      ssl_session_tickets off;
      ssl_prefer_server_ciphers off;
      ssl_stapling on;
      ssl_stapling_verify on;
      add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
    '';
  };

  services.logrotate = {
    enable = true;
    settings.nginx = {
      files = "/var/log/nginx/access.log";
      frequency = "daily";
      rotate = 7;
      maxage = 7;
      postrotate = "kill -USR1 `cat /run/nginx/nginx.pid`";
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "konrad@borowski.pw";
  };
}
