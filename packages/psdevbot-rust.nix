let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "4ae081bec9836a8f089af78e9c8b3d99a85f0889";
    sha256 = "1b9z6ikcy33b6dsm8vijldyp4m8ag9dvl20r9aj468hwlayqfwi4";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
