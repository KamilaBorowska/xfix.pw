let
  pkgs = import <nixpkgs> {};
  sources = import ../nix/sources.nix;
  napalm = pkgs.callPackage sources.napalm {
    pkgs = (pkgs // {
      nodejs = pkgs.nodejs-14_x;
    });
  };
  naersk = pkgs.callPackage sources.naersk { };
  src = pkgs.fetchFromGitLab {
    owner = "pastebinrun";
    repo = "pastebinrun";
    rev = "54a5c54ad084f9913e92bfba2cc8e5cb885fcf2c";
    sha256 = "14p3mgldq3kjkbzv48sjn0adqbr5n09q1g7si7vilcr5zjd5rhmp";
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
