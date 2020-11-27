let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "45b5bf32bf3d4a8c08d23de730fbd9da118ea1fc";
    sha256 = "0ksa31k4kl9lkkq62q5cf2gvipm40grabxw6igmb16p8qyzj5vgd";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
