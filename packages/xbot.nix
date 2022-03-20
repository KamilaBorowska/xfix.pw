let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "xbot";
    rev = "a122d96195529d5e20251f9df2c73625d53bfc0d";
    sha256 = "sha256-Kk49rgYOd9SgZXwAwD27PWyPmexl9fDw5HbHxXhxf60=";
  };
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
