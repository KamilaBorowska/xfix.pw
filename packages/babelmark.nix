with import <nixpkgs> {};

rustPlatform.buildRustPackage {
  name = "pulldown-cmark-babelmark";

  src = fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "pulldown-cmark-babelmark";
    rev = "9cb8d814dfb3e058f0c086b19514811ef1bced8e";
    sha256 = "1dsfd8nlbqd2pr0nk8g73bkvab6j2p0wixxv6ac54fxfp0lh1hb2";
  };

  cargoSha256 = "1zrlj0llcxdanm2s4lsc3gjx2vd1fm5jj3j6db26wnz711kxlh5j";
}
