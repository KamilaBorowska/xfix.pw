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
    rev = "145a02b7c397ddcf3c90d272802e31dcedde9290";
    sha256 = "1j368qw3z3gm858ixwnjy6x3qq0m22z3gg3jl10nqsxfn626n905";
  };
}
