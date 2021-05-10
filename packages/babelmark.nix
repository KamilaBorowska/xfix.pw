let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "630515fb4b03baac8d6bf01629ba7e1dfc7c6095";
    sha256 = "0ibpwm1fqhd2hqrajay7g2y1cpvk485kff69vr4q32v74a4drb4r";
  };
}
