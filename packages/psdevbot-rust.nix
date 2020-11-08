let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "37067ec4551e916f390ad735f5b69b475a04e2e1";
    sha256 = "0gfa9kg2927jwxc62xar5svrf8hb3vvlmd3zjpawm3nn2kzm818d";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
