let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
  nightly = nixpkgs.rustChannelOf {
    channel = "nightly";
    date = "2019-10-13";
    sha256 = "170i0s9rhhmdgjpxfk1vh9b229jpynmimvphz3nqsp40s7czg7mp";
  };
in
  with nixpkgs;
  (makeRustPlatform {
    rustc = nightly.rust;
    inherit cargo;
  }).buildRustPackage {
    name = "pastebinrun";

    src = fetchFromGitLab {
      owner = "pastebin.run";
      repo = "server";
      rev = "a5ee95e8340e1b27b2b95da9a6386f74e0b30efb";
      sha256 = "0r9nk6axbb31nn0ciqz55zysqh9q1dmbvrchjpjs4zhjd7hgsmlv";
    };

    cargoSha256 = "1x5jk60fjnxgv81ibf7a24w7k2nz6cvfs375vcwdwfmrwhfvh5p2";

    patchPhase = ''
      export HOME="$TMPDIR"
      npm install
      patchShebangs node_modules/webpack/bin/webpack.js
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp $releaseDir/pastebinrun $out/bin
      cp -r static migrations $out
      runHook postInstall
    '';

    nativeBuildInputs = [ nodejs pkgconfig ];
    buildInputs = [ openssl postgresql ];

    outputHashAlgo = "sha256";
    outputHashMode = "recursive";
    outputHash = "0qdmqymh1hf600dvd131mj5kx81fww5l1g85r2qgyp7vxz1m7cyk";
  }
