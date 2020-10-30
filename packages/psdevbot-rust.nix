let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "09590d44baeb401703e8450a4cedff7ca839f89e";
    sha256 = "08p0vqd73qwdw4hxcxcysr3zpb41d2qsbf9h88wbpmh5nmrpgw5m";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
