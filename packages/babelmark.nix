with import <nixpkgs> {};

rustPlatform.buildRustPackage {
  name = "pulldown-cmark-babelmark";

  src = fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "e15ad53616625b2b142c07dbe3878477b1bd63e3";
    sha256 = "16qinliscmrlj8r1nz0ky8nmckkq64v1l6wr3sjqsi3sr2g70gyk";
  };

  cargoSha256 = "1jhf8rngxij88bigj1v03w1hs03w5j19lvvbb5v67qaialkfaghd";
}
