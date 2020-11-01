let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "8772b05bf5ed0e1f012fab891b44b6cd1942b87e";
    sha256 = "1vh3zpz2ip0qaawri0xylj8847cxsvqrsmcniq14bsxg7vhy66x8";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
