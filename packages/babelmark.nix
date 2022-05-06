let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "a63e6ff9f20932d7ca94f9566467d24fd9cfd767";
    sha256 = "0qp3w61xqpnfg4kam27mfxrpkvv527qxjjga4d4i0gq0cbgl0v8v";
  };
}
