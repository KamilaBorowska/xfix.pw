let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "24a597d9d7ea9a946dbab376ec179bb10a837b27";
    sha256 = "1s15qawnji7plrdz26bqm9mh68m4k1djynl9cn8s9bzc8jnpdvs1";
  };
}
