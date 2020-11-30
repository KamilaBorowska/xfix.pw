let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "612c518cf7854f1caa1d489feb3a2aa15f70480a";
    sha256 = "0hg5lyk5ybi0vf846jcc8dz4j9lajql5zf6rvvin6sai46az6qy5";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
