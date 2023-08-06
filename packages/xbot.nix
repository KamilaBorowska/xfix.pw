let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = sources.xbot;
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.cairo pkgs.pango pkgs.openssl ];
}
