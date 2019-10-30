with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "pastebinrun";
  src = fetchzip {
    url = "https://gitlab.com/pastebin.run/server/-/jobs/337729305/artifacts/download.zip";
    sha256 = "1q1y222yqphq042vb869grcx73ffzrmpk8fqwhw8f4693flzypz9";
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
