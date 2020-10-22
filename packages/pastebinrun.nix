let
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
with import <nixpkgs> {};
rustPlatform.buildRustPackage {
  pname = "pastebinrun";
  version = "0.1.0";
  src = client-js-base.src;
  cargoSha256 = "07pnx3b3gn1pzdcx92hjbl3cqmpwikkbhgp062m9lc3bzzdmrj5b";
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
  doCheck = true;
  checkInputs = [ postgresql ];
  checkPhase = ''
    export PGDATA=$TMP/db
    export PGHOST=$TMP/socketdir
    pg_ctl initdb
    echo "unix_socket_directories = '$PGHOST'" >> $PGDATA/postgresql.conf
    mkdir $PGHOST
    pg_ctl start
    createdb pastebinrun
    export DATABASE_URL=postgresql:///pastebinrun
    cargo test --release --frozen --features database_tests
  '';
}
