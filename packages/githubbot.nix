with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "github-bot";
  src = fetchFromGitHub {
    owner = "smogon";
    repo = "GitHub-Bot";
    rev = "0661f94650293a91ad848fdfb73b876748bdeaa0";
    sha256 = "10jxik1glz0w5j1cnayrxkc61a67s2ki0aqsz8qqkqwrqb1152qj";
  };
  buildInputs = [ nodejs ];
  buildPhase = ''
    runHook preBuild
    export HOME="$TMPDIR"
    npm install -l
    patchShebangs node_modules/typescript/bin/tsc
    npm run build
    runHook postBuild
  '';
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp -r node_modules built $out
    echo $'#!/bin/sh\n${nodejs}/bin/node "$(dirname "$0")"/../built/server.js\n' > $out/bin/githubbot
    chmod +x $out/bin/githubbot
    runHook postInstall
  '';
  outputHashAlgo = "sha256";
  outputHashMode = "recursive";
  outputHash = "1k8janwq66xdnlcg3a35nia039xpa07a6hhz8xajkbzd5kh4yd0y";
}
