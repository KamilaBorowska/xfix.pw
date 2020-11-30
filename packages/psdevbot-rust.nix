let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "b5befc3475c0c4f85ca7236ac5e54e2a5e9c06c5";
    sha256 = "013iry6hw9xqxvsqi0y98fkx3id57i139wzyi6yvvw16wxcapb4l";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
