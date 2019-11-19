with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "pastebinrun";
  src = fetchzip {
    url = "https://gitlab.com/pastebin.run/server/-/jobs/354939196/artifacts/download.zip";
    sha256 = "0bfxi6ic889vrr0wvjlmbjz7x5c1r9s3pa87k1l2042vm3vp2dqb";
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
