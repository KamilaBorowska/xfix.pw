let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "xbot";
    rev = "6b99e6bc315d34cb71d3a7178fd65db83a1a7f83";
    sha256 = "sha256-Zmiv/9Ie4nFVCOU/SYM4GSa2NAbbZeSFEyZ+YDluXwg=";
  };
  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
