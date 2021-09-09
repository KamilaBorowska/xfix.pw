let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "90882620cd28b74278777a264d9999c5d1859de1";
    sha256 = "0p2aidw5hz7gki8zkxyayhgrcg6b0830j6drnc2xnjjxn4n4sq4r";
  };
}
