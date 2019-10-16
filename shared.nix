with import <nixpkgs> {};

{
  services.postgresql.package = pkgs.postgresql_11;
  services.nginx = {
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    appendHttpConfig = ''
      add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload" always;
    '';
  };
}
