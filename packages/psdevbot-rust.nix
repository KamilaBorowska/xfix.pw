let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "9dcbdd045bad911f81dfe84b8a04ad438ec64a85";
    sha256 = "1paqkcgmys1dgcz7x1x20ifpa61z0r4ykrxlsayp6xb6kmc75jmg";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
