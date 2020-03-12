with import <nixpkgs> {};

rustPlatform.buildRustPackage.override { rustc = rustc_1_41; } {
  name = "pulldown-cmark-babelmark";

  src = fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "17bedafc181e688c137c0efff914fcbad9b877ae";
    sha256 = "0qz9l50fjazkkgbwj2cza22aaprh6bh6pbhw5aygg2lw147bw7rc";
  };

  cargoSha256 = "0882h3d1c6yiamzmw5mqyvivh3lhbsmrd7z7cc1p8z9a3f9ajl4y";
}
