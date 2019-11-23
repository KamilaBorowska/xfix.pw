let
  unstable = import (fetchTarball {
    url = https://github.com/NixOS/nixpkgs-channels/archive/e89b21504f3e61e535229afa0b121defb52d2a50.tar.gz;
    sha256 = "0jqcv3rfki3mwda00g66d27k6q2y7ca5mslrnshfpbdm7j8ya0kj";
  }) {};
  client-js-base = (import ./nodejs {})."pastebinrun-git+https://gitlab.com/pastebin.run/server.git";
  client-js = client-js-base.override {
    version = "0.1.0";
    postInstall = ''
      patchShebangs .
      node_modules/.bin/webpack
      mv $out/lib/node_modules/pastebinrun/entry $out
      mkdir -p $out/static
      mv $out/lib/node_modules/pastebinrun/static/js $out/static
      rm -r $out/lib
    '';
  };
in
unstable.rustPlatform.buildRustPackage (with import <nixpkgs> {}; {
  pname = "pastebinrun";
  version = "0.1.0";
  src = client-js-base.src;
  cargoSha256 = "08h52pb3nv8c1nh750s3kl1qia7l7r0ssszrqxq3b6vh9q6r08z3";
  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ openssl postgresql.lib ];
  patchPhase = ''
    ln -s ${client-js}/entry entry
    ln -s ${client-js}/static/js static/js
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp $releaseDir/pastebinrun $out/bin
    cp -r static migrations languages.json $out
  '';
})
