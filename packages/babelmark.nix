let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "78f5ab6d529547d41d1fad5f9ba611f9e87c6cce";
    sha256 = "099db7rw8ll5yyp9b6ds1b022yidsw7zry24szc036lb8sy486pl";
  };
}
