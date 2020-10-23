let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  name = "pulldown-cmark-babelmark";

  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "e15ad53616625b2b142c07dbe3878477b1bd63e3";
    sha256 = "16qinliscmrlj8r1nz0ky8nmckkq64v1l6wr3sjqsi3sr2g70gyk";
  };
}
