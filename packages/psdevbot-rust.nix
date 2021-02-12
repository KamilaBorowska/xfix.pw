let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "2e18b708e5065e1bed9ce3b89ba1551d828da0d5";
    sha256 = "1ck2hc4bhxfg82vk4p9sac0z8ppnymp8in6ai9fd2gsc5pz4wr83";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
