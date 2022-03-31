let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "xbot";
    rev = "93556b366d628c2141795ee68ac52d9e825a417a";
    sha256 = "sha256-gmIEXBtr9zQKUQCjE/luRrsqOIuZENpl05FZNzW0XcA=";
  };
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
