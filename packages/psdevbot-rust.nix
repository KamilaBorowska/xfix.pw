let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "4573bbd1b7f4c429f869eaec9462d09a9797e1d8";
    sha256 = "1kwj6nlryvvy3pypk5my1mx5l7vpbihdffzm0y0pj6vjpbldiyvb";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
