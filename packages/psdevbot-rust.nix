let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "c6f9fb5833e23f541aa7d73e97b82a589a88a1dd";
    sha256 = "01fcish67x5yd7nca4i6y2m9m2pay50wj4affpdyxyphs29zdbc4";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
