let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "f3dcc9a404eee6f3e21a206cde124462bb83cbe9";
    sha256 = "1v8qvbm1nbjqsl9icj568nbc6jknjqynsdzwf9l9a7f3gj53zfm2";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
