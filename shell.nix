with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "nixops-shell";
  buildInputs = [ nixops ];
  revision = "e1843646b04fb564abf6330a9432a76df3269d2f";
  shellHook = ''
    export NIX_PATH="nixpkgs=https://github.com/NixOs/nixpkgs/archive/${revision}.tar.gz"
  '';
}
