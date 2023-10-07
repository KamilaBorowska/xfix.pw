# SPDX-FileCopyrightText: 2023 Konrad Borowski <konrad@borowski.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{pkgs, ...}: {
  users.users.sandbox = {
    createHome = true;
    home = "/run/sandbox";
    isSystemUser = true;
    group = "sandbox";
  };

  users.groups.sandbox = {};

  systemd.services.sandbox = {
    wantedBy = ["multi-user.target"];
    enable = true;
    environment.ROCKET_PORT = "8082";
    script = ''
      ${pkgs.nix-based-sandbox}/bin/sandbox
    '';

    path = with pkgs; [
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
      rust-bin.stable.latest.default

      # Programs used by xbot
      python311Packages.ftfy
    ];

    environment = {
      JAVA8 = pkgs.jdk8;
      JAVA11 = pkgs.jdk11;
      RUST_BETA = pkgs.rust-bin.beta.latest.default;
      RUST_NIGHTLY = pkgs.rust-bin.nightly.latest.default;
    };

    serviceConfig = {
      User = "sandbox";
      PrivateTmp = true;
      Restart = "always";
      WorkingDirectory = "/run/sandbox";
    };
  };
}
