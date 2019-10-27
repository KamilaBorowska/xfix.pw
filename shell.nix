with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "nixops-shell";
  buildInputs = [ nixops ];
  revision = "c75de8bc12cc7e713206199e5ca30b224e295041";
  shellHook = ''
    export NIX_PATH="nixpkgs=https://github.com/NixOs/nixpkgs/archive/${revision}.tar.gz"
  '';
}
