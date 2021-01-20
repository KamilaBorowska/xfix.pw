let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "6f2fef7b3fddf17ad6168c9bc41a866cef81c991";
    sha256 = "1p535x59vndf27gy3llpcm6qvzcz6gdldy3daz4ikp8aamakijld";
  };
}
