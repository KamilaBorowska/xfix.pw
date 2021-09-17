let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "b3a3c92e4fb77dd082074629d40ccc8e38144102";
    sha256 = "0i8k0hlv9vagwj76hacwfjfif6y2k83f4zcw0xmshb0g7hc716iy";
  };
}
