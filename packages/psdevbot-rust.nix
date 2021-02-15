let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "f284c2644e9a99c81328d7ba1dc763203dde09bc";
    sha256 = "1irwibw8vzpc70g0qh8rgr2q5nlz6d46qzxfji1d4cy6v5j70psk";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
