let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "78f140cc90f66c4dce62fd869e82210d2ce7bb7e";
    sha256 = "0gz1g265vjagn5sn208gkaghwa76faavx4wb7rj6vczyqcqc6lc3";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
