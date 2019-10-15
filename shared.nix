with import <nixpkgs> {};

{
  services.postgresql.package = pkgs.postgresql_11;
}
