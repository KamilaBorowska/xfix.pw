let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "14c862be090eec0809f9e81e0494facdfd27dc57";
    sha256 = "09b14mj6qngvzsr97l6mdf7pk4ybvipxn2y1790j52d9rdgzz1w7";
  };
}
