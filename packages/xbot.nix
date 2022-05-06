let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "xbot";
    rev = "74cd466329b144e9996a25376b6cd7e2d98b0231";
    sha256 = "1nsay4vl5f9h1madgd9icz7fmf60nj4fnj5s7i9jlmqkhj5ldf3x";
  };
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
