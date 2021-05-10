let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "5a8c4b5beb1be10bd0d36cab9fb609a74bfb95b6";
    sha256 = "11maa10khdkf9j7fcg70660ilkirabdqafvnk2562vjmqccxc9iw";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
