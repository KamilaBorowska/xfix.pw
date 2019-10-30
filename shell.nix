with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "nixops-shell";
  buildInputs = [ nixops ];
  revision = "12f5d47ef277ba3106a50f91d41b3750cf68f8e7";
  shellHook = ''
    export NIX_PATH="nixpkgs=https://github.com/NixOs/nixpkgs/archive/${revision}.tar.gz"
  '';
}
