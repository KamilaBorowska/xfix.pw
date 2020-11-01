let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "7da0cd5b04fcbb0af5205e683f00941eb506ebd8";
    sha256 = "1wfgsf6fjpaffcdk23ngnvd6grpczpwhbphd3xh799ix8s5r2fhn";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
