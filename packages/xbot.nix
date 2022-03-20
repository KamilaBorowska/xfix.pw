let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "xbot";
    rev = "99a48fcef7fd08a1871e7074779fa3251a26f6e3";
    sha256 = "sha256-ufHqPs+DYotnP7/W4ZXjY14ticSgtzgMQJhpIQ79TcI=";
  };
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
