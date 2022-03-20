let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "xbot";
    rev = "a8e77bcd9f623ce5cf8790e2be84a3a89eca4f85";
    sha256 = "sha256-7n2QfPPcjwL337bkW9elh9JUN1ZX5MWgOc73j9ysy/A=";
  };
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
