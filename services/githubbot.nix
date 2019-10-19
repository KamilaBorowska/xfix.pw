{ nickname, password, room, secret, nginxVirtualHostDefaults }:
  {
    users.users.githubbot = {
      extraGroups = [ "keys" ];
      isSystemUser = true;
    };

    services.nginx = {
      enable = true;
      virtualHosts = nginxVirtualHostDefaults {
        "showdown.xfix.pw" = {
          forceSSL = true;
          root = ./githubbot;
          locations."/github".proxyPass = "http://127.0.0.1:3420";
        };
      };
    };

    systemd.services.githubbot = rec {
      wantedBy = [ "multi-user.target" ];
      after = [ "githubbot-secret-key.service" "githubbot-password-key.service" ];
      wants = after;
      enable = true;
      environment = {
        npm_package_config_webhookport = "3420";
        npm_package_config_server = "sim.smogon.com";
        npm_package_config_serverport = "8000";
        npm_package_config_serverid = "showdown";
        npm_package_config_nickname = nickname;
        npm_package_config_room = room;
      };
      script = let
        node = "${(import <nixpkgs> {}).nodejs-12_x}/bin/node";
      in
      ''
        export npm_package_config_secret=$(cat /var/keys/githubbot-secret)
        export npm_package_config_password=$(cat /var/keys/githubbot-password)
        ${node} server.js
      '';
      serviceConfig = {
        User = "githubbot";
        Restart = "always";
        WorkingDirectory = "${import ../packages/githubbot.nix}/lib/node_modules/psdevbot/built";
      };
    };

    deployment.keys.githubbot-secret = {
      destDir = "/var/keys";
      user = "githubbot";
      text = secret;
    };

    deployment.keys.githubbot-password = {
      destDir = "/var/keys";
      user = "githubbot";
      text = password;
    };
  }
