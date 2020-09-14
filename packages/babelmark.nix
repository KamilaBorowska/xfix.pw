with import <nixpkgs> {};

rustPlatform.buildRustPackage {
  name = "pulldown-cmark-babelmark";

  src = fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "9bd725eefc60ba732ca7108565abe3566584d18b";
    sha256 = "04q7n0f9b0y2j0nbc2qr2xznpv7wg9q24zh5w9zjnkliigqgjm4k";
  };

  cargoSha256 = "16f8plgkwj4wycqgm7637z0ykhr0mz93vsnsbhdx5q2aqmmcwf53";
}
