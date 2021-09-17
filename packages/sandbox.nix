let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "89e22555e1f1eb0fce16de4c3592cfcb555cfc59";
    sha256 = "13fdfnmxx87hwh457jzzl7p9rvh7nnpifhz1a78cvzv65wvmr3hc";
  };
}
