let
  sources = import ../nix/sources.nix;
  pkgs = import <nixpkgs> { overlays = [ (import sources.nixpkgs-mozilla) ]; };
  toolchain = (pkgs.rustChannelOf { channel = "1.71.1"; }).rust;
  naersk = pkgs.callPackage sources.naersk {
    cargo = toolchain;
    rustc = toolchain;
  };
in
naersk.buildPackage {
  src = sources.xbot;
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.cairo pkgs.pango pkgs.openssl ];
}
