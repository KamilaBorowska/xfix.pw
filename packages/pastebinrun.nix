with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "pastebinrun";
  src = fetchzip {
    url = "https://gitlab.com/pastebin.run/server/-/jobs/341126658/artifacts/download.zip";
    sha256 = "03s1l40iwyvvgz1x0gn16za9zj6n710fd9czg1b1h0i8amspyah5";
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
