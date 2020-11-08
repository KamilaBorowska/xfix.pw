let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "171226799d3ffd0b53eedd48ab309fb803b2a714";
    sha256 = "1z0lbzjpsfwr7xvwnb04x6kzkc9zi8cx9dj5v0647r4wzf068b2y";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
