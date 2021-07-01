let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  napalm = pkgs.callPackage sources.napalm { };
  naersk = pkgs.callPackage sources.naersk { };
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "pastebinrun";
    rev = "6fc7eda161cde9ce8d63b60604573d216da9b567";
    sha256 = "0msmzl29wqk3xcyskzv28yly0gbp5bp52yhxwq95f7zfvsmaanif";
  };
  client-js-base = napalm.buildPackage src {};
  client-js = pkgs.stdenv.mkDerivation {
    name = "client-js";
    inherit src;
    buildPhase = ''
      ln -s ${client-js-base}/_napalm-install/node_modules .
      node_modules/.bin/webpack
    '';
    installPhase = ''
      mkdir $out
      mv entry languages.json migrations static $out
    '';
  };
  pastebinrun = naersk.buildPackage {
    name = "pastebinrun";
    src = pkgs.symlinkJoin {
      name = "src";
      paths = [ client-js src ];
    };
    nativeBuildInputs = [ pkgs.pkgconfig ];
    buildInputs = [ pkgs.openssl pkgs.postgresql_11.lib ];
    doCheck = true;
    checkInputs = [ pkgs.postgresql_11 ];
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
