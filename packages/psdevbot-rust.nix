let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "d3b63109d2c3fd5bdeb4a6ab2d4fd0eb79e8005d";
    sha256 = "0jpdvzd7chkypc03p08vy91d2z0n59qz5fszq1bm3sixqsz1sjf6";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
