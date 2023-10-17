# SPDX-FileCopyrightText: 2023 Konrad Borowski <konrad@borowski.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  napalm,
  naersk,
  src,
  stdenv,
  pkgconfig,
  openssl,
  postgresql_14,
  symlinkJoin,
}: let
  client-js-base = napalm.buildPackage src {};
  client-js = stdenv.mkDerivation {
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
    src = symlinkJoin {
      name = "src";
      paths = [client-js src];
    };
    root = src;
    nativeBuildInputs = [pkgconfig];
    buildInputs = [openssl postgresql_14.lib];
    doCheck = true;
    checkInputs = [postgresql_14];
    preCheck = ''
      export PGDATA=$TMP/db
      export PGHOST=$TMP/socketdir
      pg_ctl initdb
      echo "unix_socket_directories = '$PGHOST'" >> $PGDATA/postgresql.conf
      mkdir $PGHOST
      pg_ctl start
      createdb pastebinrun
      export ROCKET_DATABASES='{ main = { url = "postgresql:///pastebinrun" } }'
    '';
    cargoTestOptions = xs: xs ++ ["--features database_tests"];
  };
in
  symlinkJoin {
    name = "pastebinrun-full";
    paths = [client-js pastebinrun];
  }
