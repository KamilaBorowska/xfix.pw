let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "1f3125d38b2d98714ff62d198d9d3f7420dfc9d2";
    sha256 = "0ga6iz8mk30flib7nbi65cwfrfk3dhvb2jr0wwjzld8v9wir55lp";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
