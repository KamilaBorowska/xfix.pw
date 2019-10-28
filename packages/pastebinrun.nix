with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "pastebinrun";
  src = fetchzip {
    url = "https://gitlab.com/pastebin.run/server/-/jobs/334868996/artifacts/download.zip";
    sha256 = "17wcnbp3ail0p3jr5vy2z831rcckzmvin52pl795g0l3jbcyw95x";
    stripRoot = false;
  };
  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ openssl postgresql.lib ];
  installPhase = ''
    mkdir -p $out/bin
    cp -r migrations static $out
    cp target/release/pastebinrun $out/bin
  '';
}
