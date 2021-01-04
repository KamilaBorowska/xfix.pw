let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "d5995e1fdd611668f7aa11659214b9ab1d841299";
    sha256 = "0wawgjlgmx6kr7rbyrmngla2anqq4fr2s9r5ipkygacsxvr2jlp6";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
