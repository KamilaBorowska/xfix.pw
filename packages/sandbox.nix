let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "nix-based-sandbox";
    rev = "58a8e67258c5c4be5bab35752a54699746c7dd9c";
    sha256 = "10pd80zfb8qyxhj7kcn0fnf1lzfrscimzwiqb23dj4a6xsq9ccng";
  };
}
