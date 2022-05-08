let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  napalm = pkgs.callPackage sources.napalm { };
  naersk = pkgs.callPackage sources.naersk { };
  src = sources.pastebinrun;
  client-js-base = napalm.buildPackage src {};
  client-js = pkgs.stdenv.mkDerivation {
    name = "client-js";
    inherit src;
    buildPhase = ''
      ln -s ${client-js-base}/_napalm-install/node_modules .
      node_modules/.bin/vite build
    '';
    installPhase = ''
      mkdir $out
      mv dist languages.json migrations templates $out
    '';
  };
  pastebinrun = naersk.buildPackage {
    name = "pastebinrun";
    src = pkgs.symlinkJoin {
      name = "src";
      paths = [ client-js src ];
    };
    nativeBuildInputs = [ pkgs.pkgconfig ];
    buildInputs = [ pkgs.openssl pkgs.postgresql_14.lib ];
    doCheck = true;
    checkInputs = [ pkgs.postgresql_14 ];
    preCheck = ''
      export PGDATA=$TMP/db
      export PGHOST=$TMP/socketdir
      pg_ctl initdb
      echo "unix_socket_directories = '$PGHOST'" >> $PGDATA/postgresql.conf
      mkdir $PGHOST
      pg_ctl start
      createdb pastebinrun
      export DATABASE_URL=postgresql:///pastebinrun
    '';
    cargoTestOptions = xs: xs ++ [ "--features database_tests" ];
  };
in
pkgs.symlinkJoin {
  name = "pastebinrun-full";
  paths = [ client-js pastebinrun ];
}
