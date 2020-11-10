let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "3022f699fd1d60851a0017eeaec91696b7a715ff";
    sha256 = "0snp9c7zxd397w4ql3iiv9w9lrvwc1bps6j72z9gxyx80bvak97g";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
