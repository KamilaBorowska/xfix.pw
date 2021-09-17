let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "9e789ded4aee47239e70a9390d60d6cc26325498";
    sha256 = "1xgy15y50xspmcl2h9r3ypdj84ny5kp6hpy1pspd2iazgk2sa3hs";
  };
}
