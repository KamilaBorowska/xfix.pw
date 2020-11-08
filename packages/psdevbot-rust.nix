let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "f2a19a3461b8afb5527d5cb475a73cf8b0950830";
    sha256 = "0cdvv1lxr4x251i2jf05m8n1s5zfw8qq1k681kv1jqwm55cr1n85";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
