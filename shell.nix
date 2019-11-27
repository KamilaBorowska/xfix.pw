with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "nixops-shell";
  buildInputs = [ nixops ];
  shellHook = ''
    export NIX_PATH="nixpkgs=https://nixos.org/channels/nixos-19.09-small/nixexprs.tar.xz"
  '';
}
