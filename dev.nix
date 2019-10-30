{
  xfix = { lib, ... }:
    {
      imports = let
        nginxVirtualHostDefaults = lib.attrsets.mapAttrs (key: value: value // {
          sslCertificate = ./dev-tls/full.pem;
          sslCertificateKey = ./dev-tls/server.key;
        });
      in
      [
        ./shared.nix
        ./services/mail.nix
        (import ./services/babelmark.nix {
          inherit nginxVirtualHostDefaults;
        })
        (import ./services/borowski.nix {
          inherit nginxVirtualHostDefaults;
        })
        (import ./services/githubbot.nix {
          nickname = "GitHub Test";
          password = "";
          room = "botdevelopment";
          secret = "";
          inherit nginxVirtualHostDefaults;
        })
        (import ./services/nextcloud.nix {
          inherit nginxVirtualHostDefaults;
        })
        (import ./services/pastebinrun.nix {
          inherit nginxVirtualHostDefaults;
        })
        (import ./services/xfix.nix {
          inherit nginxVirtualHostDefaults;
        })
      ];

      deployment.targetEnv = "virtualbox";
      deployment.virtualbox.memorySize = 2048;
      deployment.virtualbox.vcpu = 1;
      deployment.virtualbox.headless = true;

      # Hack for adding CAs to Firefox being tricky
      services.nginx.virtualHosts.xfix.root = ./dev-tls;
    };

  client = { lib, pkgs, nodes, ... }:
    {
      deployment.targetEnv = "virtualbox";
      deployment.virtualbox.memorySize = 2048;
      deployment.virtualbox.vcpu = 1;
      security.pki.certificateFiles = [ ./dev-tls/ca.crt ];
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
      networking.extraHosts = let
        hosts = builtins.attrNames nodes.xfix.config.services.nginx.virtualHosts;
        ip = nodes.xfix.config.networking.privateIPv4;
      in
      "${ip} ${lib.strings.concatStringsSep " " hosts}";
    };
}
