let
  all_hosts = nodes: builtins.attrNames nodes.xfix.config.services.nginx.virtualHosts;
  xfix_ip = nodes: nodes.xfix.config.networking.privateIPv4;
  hosts = nodes: "${xfix_ip nodes} ${(import <nixpkgs> {}).lib.strings.concatStringsSep " " (all_hosts nodes)}";
  ca = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/letsencrypt/pebble/b8d114533e42a2f5ad98697225e8b10775384157/test/certs/pebble.minica.pem";
    sha256 = "0afclmfclp7wm0zbjb7kc7ld1sjkriqsy5h1a822fbplxlgad15s";
  };
in
{
  xfix = { lib, pkgs, ... }:
  {
    imports = [
    ./shared.nix
      ./services/mail.nix
      ./services/babelmark.nix
      ./services/borowski.nix
      ./services/nextcloud.nix
      ./services/pastebinrun.nix
      ./services/xfix.nix
    ];

    security.pki.certificateFiles = [ ca ];

    nixpkgs.overlays = [
      (self: super: {
        simp_le = pkgs.writeShellScriptBin "simp_le" ''
          ${super.simp_le}/bin/simp_le "$@" --server https://pebble:14000/dir
        '';
      })
    ];

    deployment.targetEnv = "virtualbox";
    deployment.virtualbox.memorySize = 2048;
    deployment.virtualbox.vcpu = 1;
    deployment.virtualbox.headless = true;
  };

  client = { lib, pkgs, nodes, ... }:
  {
    deployment.targetEnv = "virtualbox";
    deployment.virtualbox.memorySize = 2048;
    deployment.virtualbox.vcpu = 1;
    security.pki.certificateFiles = [ ca ];
    services.xserver = {
      enable = true;
      desktopManager = {
        plasma5.enable = true;
        default = "plasma5";
      };
      displayManager.auto = {
        enable = true;
        user = "client";
      };
    };
    users.users.client = {
      isNormalUser = true;
      password = "";
    };
    environment.systemPackages = with pkgs; [ firefox ];
    networking.extraHosts = hosts nodes;
  };

  pebble = { pkgs, nodes, ... }:
  let
    pebbleConf.pebble = {
      listenAddress = "0.0.0.0:14000";
      managementListenAddress = "0.0.0.0:15000";
      certificate = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/letsencrypt/pebble/b8d114533e42a2f5ad98697225e8b10775384157/test/certs/localhost/cert.pem";
        sha256 = "1lwnv9gqhyr0n7vbpv2ys2p6ja0hhjls7xg2sgf45bif0mnkq8ik";
      };
      privateKey = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/letsencrypt/pebble/b8d114533e42a2f5ad98697225e8b10775384157/test/certs/localhost/key.pem";
        sha256 = "03phxh8v27x8rprm4nkfylya8rkzc9mhap1k2wf75q5han99fxq9";
      };
      httpPort = 80;
      tlsPort = 443;
      ocspResponderURL = "http://0.0.0.0:4002";
    };
  in
  {
    deployment.targetEnv = "virtualbox";
    deployment.virtualbox.memorySize = 1024;
    deployment.virtualbox.vcpu = 1;
    deployment.virtualbox.headless = true;
    systemd.services.pebble = {
      enable = true;
      wantedBy = [ "multi-user.target" ];
      preStart = ''
        mkdir -p /var/lib/pebble
      '';
      script = ''
        cd /var/lib/pebble
        ${pkgs.pebble}/bin/pebble -config ${pkgs.writeText "pebble.conf" (builtins.toJSON pebbleConf)}
      '';
    };
    networking.extraHosts = hosts nodes;
    networking.firewall.allowedTCPPorts = [ 4002 14000 15000 ];
  };
}
