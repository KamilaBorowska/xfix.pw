# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  napalm,
  naersk,
  src,
  stdenv,
  pkg-config,
  openssl,
  postgresql_14,
  symlinkJoin,
}: let
  client-js = napalm.buildPackage src {
    name = "client-js";
    inherit src;
    installPhase = ''
      npx vite build
      mkdir $out
      mv dist languages.json migrations templates $out
    '';
  };
  pastebinrun = naersk.buildPackage {
    name = "pastebinrun";
    src = src;
    nativeBuildInputs = [pkg-config];
    buildInputs = [openssl postgresql_14.lib];
    prePatch = ''
      cp -r ${client-js}/dist .
    '';
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
