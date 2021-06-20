let
  moz_overlay = import (builtins.fetchTarball "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz");
  pkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
in
with pkgs;
{
  programs.firejail.enable = true;

  users.users.sandbox = {
    createHome = true;
    home = "/var/lib/sandbox";
    isSystemUser = true;
  };

  systemd.services.sandbox = {
    wantedBy = [ "multi-user.target" ];
    enable = true;
    environment.ROCKET_PORT = "8082";
    script = ''
      ${import ../packages/sandbox.nix}/bin/sandbox
    '';

    path = [
      bash
      dotnet-sdk_5
      ghc
      perl
      php
      rakudo
      sqlite

      # C/C++
      clang
      gcc

      # Go
      go
      goimports

      # Node.js
      nodejs
      nodePackages.typescript

      # Python
      black
      python
      
      # Rust
      cargo
      clippy
      rustfmt
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
    };
  };
}
