let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "80c0ae54d0885999f29db3095c020fa62d3ede77";
    sha256 = "1rx9dk109r2j1akcqs0f59prlb5bp7z34s1qwjr6zs6bjhg79iqj";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
