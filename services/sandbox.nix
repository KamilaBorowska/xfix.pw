let
  sources = import ../nix/sources.nix;
  pkgs = import <nixpkgs> { overlays = [ (import sources.nixpkgs-mozilla) ]; };
in
with pkgs;
{
  users.users.sandbox = {
    createHome = true;
    home = "/run/sandbox";
    isSystemUser = true;
    group = "sandbox";
  };
  users.groups.sandbox = {};

  systemd.services.sandbox = {
    wantedBy = [ "multi-user.target" ];
    enable = true;
    environment.ROCKET_PORT = "8082";
    script = ''
      ${import ../packages/sandbox.nix}/bin/sandbox
    '';

    path = [
      bubblewrap

      # Basic programs that could be expected in PATH
      acl
      attr
      bzip2
      coreutils-full
      curl
      diffutils
      findutils
      gawk
      getent
      getconf
      gnugrep
      gnupatch
      gnused
      gnutar
      gzip
      xz
      less
      netcat
      mkpasswd
      procps
      su
      time
      util-linux
      which
      zstd

      bash
      dotnet-sdk_7
      ghc
      perl
      php
      rakudo
      sqlite

      # C/C++
      clang_14
      gcc

      # Go
      go
      gotools

      # Node.js
      nodejs
      nodePackages.prettier
      nodePackages.typescript

      # Python
      black
      python311

      # Rust
      rustChannels.stable.rust

      # Programs used by xbot
      python311Packages.ftfy
    ];

    environment = {
      JAVA8 = openjdk8;
      JAVA11 = openjdk11;
      RUST_BETA = rustChannels.beta.rust;
      RUST_NIGHTLY = rustChannels.nightly.rust;
    };

    serviceConfig = {
      User = "sandbox";
      PrivateTmp = true;
      Restart = "always";
      WorkingDirectory = "/run/sandbox";
    };
  };
}
