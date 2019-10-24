with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "pastebinrun";
  src = fetchzip {
    url = "https://gitlab.com/pastebin.run/server/-/jobs/332156568/artifacts/download.zip";
    sha256 = "00rrlcivbi5h9a9cdx4s7pdsvk8av448qrlq3lk7nc7jp32rv5h4";
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
