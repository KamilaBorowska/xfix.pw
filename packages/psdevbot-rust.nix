let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "984d3cc345972bcab093b731cb6bfdd6a705ea8c";
    sha256 = "1l1pky13wxz02ic2r5hpfqxhrmi4qazjw045v6ghn5kkzw7d6s0y";
  };
}
