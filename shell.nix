with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "nixops-shell";
  buildInputs = [ nixops ];
  revision = "6c2f097e92fc37fdb7a82564353658b45fc97945";
  shellHook = ''
    export NIX_PATH="nixpkgs=https://github.com/NixOs/nixpkgs/archive/${revision}.tar.gz"
  '';
}
