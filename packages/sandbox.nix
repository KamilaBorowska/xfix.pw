let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "77bfc774ed6045fc6a92be5c1f3d5577babff2c5";
    sha256 = "0zv2vg15f0adbp4dsdadpa7fgwxmfagwg86qq4y3blbk1f0sk54s";
  };
}
