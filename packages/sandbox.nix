let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "5bb338e97f3e265a78735f491c073c2fcf6d0fd0";
    sha256 = "sha256-+0BBQYudr1BFwUD6pXL0To5yqYxhrL0HOMyxo4GB0Fw=";
  };
}
