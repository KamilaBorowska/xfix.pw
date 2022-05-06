let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "876ed366ed852173e8286d4bb7f9c9519e7e88f6";
    sha256 = "0hq9ajw353k0zk0caa4kr3ddq4gs2l648lhxjgjr42c8gragvnc5";
  };
}
