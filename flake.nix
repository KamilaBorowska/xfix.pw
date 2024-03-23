# SPDX-FileCopyrightText: 2023 - 2024 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  inputs = {
    naersk = {
      url = "github:nix-community/naersk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    napalm = {
      url = "github:nix-community/napalm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-based-sandbox-src = {
      url = "git+https://codeberg.org/xfix/nix-based-sandbox.git";
      flake = false;
    };
    pastebinrun-src = {
      url = "git+https://codeberg.org/xfix/pastebinrun.git";
      flake = false;
    };
    pulldown-cmark-babelmark-src = {
      url = "git+https://codeberg.org/xfix/pulldown-cmark-babelmark.git";
      flake = false;
    };
    xbot-src = {
      url = "git+https://codeberg.org/xfix/xbot.git";
      flake = false;
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11-small";
  };
  outputs = {
    nixpkgs,
    naersk,
    napalm,
    rust-overlay,
    nix-based-sandbox-src,
    pastebinrun-src,
    pulldown-cmark-babelmark-src,
    xbot-src,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        rust-overlay.overlays.default
        (final: prev: {
          naersk = prev.callPackage naersk {
            rustc = prev.rust-bin.stable.latest.minimal;
            cargo = prev.rust-bin.stable.latest.minimal;
          };
          napalm = prev.callPackage napalm {};
          nix-based-sandbox = prev.callPackage pkgs/nix-based-sandbox {
            src = nix-based-sandbox-src;
          };
          pulldown-cmark-babelmark = prev.callPackage pkgs/pulldown-cmark-babelmark {
            src = pulldown-cmark-babelmark-src;
          };
          pastebinrun = prev.callPackage pkgs/pastebinrun {
            src = pastebinrun-src;
          };
          xbot = prev.callPackage pkgs/xbot {
            src = xbot-src;
          };
        })
      ];
    };
  in {
    colmena = {
      meta.nixpkgs = pkgs;
      xfix-pw = {modulesPath, ...}: {
        deployment = {
          targetHost = "xfix.pw";
          targetUser = null;
        };
        imports = [
          (modulesPath + "/profiles/headless.nix")
          ./configuration
        ];
      };
    };
    apps.${system}.colmena = {
      type = "app";
      program = "${pkgs.colmena}/bin/colmena";
    };
    formatter.${system} = pkgs.alejandra;
    checks.${system} = {
      sandbox = pkgs.testers.nixosTest {
        name = "sandbox";
        nodes.machine = ./configuration/services/sandbox;
        testScript = ''
          import json

          params = json.dumps(
              {"files": {"abc": {"contents": "def"}}, "stdin": "ghi", "code": "cat abc -"}
          )
          machine.wait_for_open_port(8082)
          output = machine.succeed(f"curl 127.0.0.1:8082 --json '{params}'")
          assert output == '{"status":0,"output":"defghi"}'
        '';
      };
    };
  };
}
