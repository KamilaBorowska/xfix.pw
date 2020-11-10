let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "b8d66803ff359b3a37cc69afb1118cd2dd2c3d4b";
    sha256 = "0hmk5907z3j0vj1qypzdw1nfzk86aniypx88hvs0gxdwr8pszbjj";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
