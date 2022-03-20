let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "xbot";
    rev = "2c844c212b16ddc80f0790884614628c21f45e81";
    sha256 = "sha256-AnPe8dKsWfV5sBBKZP/WednHz+gx9Vi92z66lz0EAJc=";
  };
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
