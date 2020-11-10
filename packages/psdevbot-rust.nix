let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "a2262bf5a31fe6e0e9361fe6c45bf533dbe0be50";
    sha256 = "0rn4n507shv07x00zm8ghnx5vm0014wrzagfg4hrgikgdj0sir1p";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
