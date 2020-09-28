with import <nixpkgs> {};

rustPlatform.buildRustPackage {
  name = "pulldown-cmark-babelmark";

  src = fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "e15ad53616625b2b142c07dbe3878477b1bd63e3";
    sha256 = "16qinliscmrlj8r1nz0ky8nmckkq64v1l6wr3sjqsi3sr2g70gyk";
  };

  cargoSha256 = "1p803cvdkank2d3jrbaq8qyvsk91bj2m91zl746d3dsx0g2zk4qg";
}
