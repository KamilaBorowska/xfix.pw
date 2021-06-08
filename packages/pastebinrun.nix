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
    rev = "7090124e7e97cf7529ffe96ac7eb9318027aae96";
    sha256 = "020kc1v5ccyc7wkfw90239j9m8hr0kmc8iprjq3ppway02gbybsb";
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
