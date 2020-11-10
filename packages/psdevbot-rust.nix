let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "9d6a5b970b74c66486c6d6cb4486fd445023a5bf";
    sha256 = "1h48lqqrah7lv342dcd7mnfw4jcs0pf0g376izr57jyjjxkmycs7";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
