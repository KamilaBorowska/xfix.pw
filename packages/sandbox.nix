let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "cf7dbc81427bdde275a1166d296738ff69c8c9bb";
    sha256 = "1vzm9z4qy9ggxpms12fi1v3jzxn0220y26lc6dd1cdsv5cxwr80r";
  };
}
