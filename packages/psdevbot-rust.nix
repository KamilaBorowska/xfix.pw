let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "129221f0d9ae363bd226b04fc999846a1312fb3e";
    sha256 = "04vnpf8bp9b1657vqlrw5vkc5xygwainq71alavfyplp2v6f44sa";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
