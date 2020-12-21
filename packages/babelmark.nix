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
    rev = "a0da5a5b66b62c10429d1834ada0708a8fa57dde";
    sha256 = "0agq4s9p8zs5d8cf2mm7aqh77cn7br61kmlv9qbxymrn58l5xwi3";
  };
}
