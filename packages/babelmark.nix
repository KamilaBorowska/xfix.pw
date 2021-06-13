let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "57893a7be61f02405afbe2330a255560887f39fb";
    sha256 = "0qhls8csmdgg9b5zll6q35rxyf7jqrzh0hv143jjdhjimg16pc4v";
  };
}
