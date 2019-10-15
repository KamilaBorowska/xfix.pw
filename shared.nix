with import <nixpkgs> {};

{
  services.postgresql.package = pkgs.postgresql_11;
  services.nginx = {
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };
}
