let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "xbot";
    rev = "3abb0e5b8413ce45f9e126ca599f4f27a76a424a";
    sha256 = "sha256-GD2KiyuFdGDO2Af3WxiDZk00GB9T2h/aN62O7QKF46A=";
  };
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
