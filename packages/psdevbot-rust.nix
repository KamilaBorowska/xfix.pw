let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "2ede54acc43862a29e20fba90dd6a22b812daa5b";
    sha256 = "1b9sv46nw6al6i4w2nh5cp7cdb9g78chzqynh0mfc8fslpkdmfks";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
