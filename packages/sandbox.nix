let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "65bca1fc0a985d1ecfe91554ca8cacf8fdd8a923";
    sha256 = "1m5h96gqy503n20g27va2ymq3rrijkfzgis9hlw6sdv1vc783zd9";
  };
}
