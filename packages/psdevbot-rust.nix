let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "8916927332df1f966c93f23d7c3b9fececb3b0e4";
    sha256 = "1vjrv0dn0zb392k65m67lxgbsd9c6zbwk6kiz881ygazkddc5wrk";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
