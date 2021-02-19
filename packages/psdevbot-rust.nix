let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "25bf15cfe060e1c1c7a5c1444062bec836fd7a24";
    sha256 = "10b1y43xwv35g2cc5lxxynnb9ahaci0cz1dci9b2bykckj811n85";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
