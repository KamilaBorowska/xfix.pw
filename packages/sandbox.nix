let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "2b9160a5aee8ab8154054ba09ce7767b4d636b0e";
    sha256 = "15lkfjaxan3nm2gqs0nc1gz3ir1913karayk7xb3f8gv32c8598m";
  };
}
