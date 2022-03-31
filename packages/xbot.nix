let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "xbot";
    rev = "5286577fcbc15f7c0e1c10e134533db2b2f55004";
    sha256 = "sha256-q+7SalRwoaH7/lz2PPcnAe4GO6Yr5FxZ+gnKJz+rWDM=";
  };
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
