let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = pkgs.fetchFromGitLab {
    owner = "KonradBorowski";
    repo = "psdevbot-rust";
    rev = "0d86561b0c85b9a1bbae41bd93042ee3039d1e41";
    sha256 = "0xk23sj0mvvzlq3gyc86b7x28xwvmwarhw7jj0xq0b44y4vlgvf8";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];
}
