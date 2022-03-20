let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "xbot";
    rev = "cf4a3ba398d5973f231725b14fa826f0b726d041";
    sha256 = "sha256-GiSqcIX51pKAyCJlnpINDCPLIk8hEajkFyPL0uNr52M=";
  };
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
