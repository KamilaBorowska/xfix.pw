let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "929b8c9b32abc3fd28c5d77f6a4bc9c1791f2ba0";
    sha256 = "11a9gjyrdy1rq2bmj8hviz504lqgcqnz28vg7byhyv1mlm6jdd6q";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
