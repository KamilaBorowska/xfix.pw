let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "xbot";
    rev = "342859cad9e098ad223809c2498ea5dcc086d630";
    sha256 = "sha256-cy8qi22OcJ1e4Pd0agWvekYqSVP2Kvg6dLOqheSZrD8=";
  };
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
