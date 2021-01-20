let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "abedccd1d8965502c0ec0cc4a2b70cae3c3bc17c";
    sha256 = "17yllc3fmrx73ngr12qf77wfaw3dk7v69i6zjaxqd8jcagrmxmpx";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
