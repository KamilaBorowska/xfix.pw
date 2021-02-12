let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "1094a02311901b7fd8b40796e30f1f4cce64b74c";
    sha256 = "00yibd9f1maqjik4441haf5wrasxkmf3nijx1whcjj88q2cwwl4v";
  };
}
