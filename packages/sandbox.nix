let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "41e281de413bdef5f5c1e6bcd09355fb5ed7038c";
    sha256 = "0zcs5yfah8f8nlpsfbhdyklcgqdqi4pr8sh37prdgq2sdv1rw2s5";
  };
}
