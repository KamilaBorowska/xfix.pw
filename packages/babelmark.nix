let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "eb99e64818738d13e4856a095b7a2fd58b5259ed";
    sha256 = "0bclyx0rzy6hpi8g73s5rgj922n3gxyfchc6gjcms49h89agjcg7";
  };
}
