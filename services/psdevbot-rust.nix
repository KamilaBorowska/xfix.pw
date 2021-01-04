{
  services.nginx.virtualHosts."showdown.xfix.pw" = {
    enableACME = true;
    forceSSL = true;
    locations."/".proxyPass = "http://127.0.0.1:3030";
  };

  systemd.services.psdevbot-rust = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    enable = true;
    environment = {
      RUST_LOG = "info";
      PSDEVBOT_SERVER = "wss://sim3.psim.us/showdown/websocket";
      PSDEVBOT_USER = "GitHub";
      PSDEVBOT_SECRET = "";
      PSDEVBOT_ROOM = "botdevelopment";
      PSDEVBOT_USERNAME_ALIASES = builtins.toJSON {
        AnnikaCodes = "Annika";
        AustinXII = "Austin";
        HoeenCoder = "HoeenHero";
        Kaiepi = "Morfent";
        KrisXV = "Kris";
        Lusamine = "Anubis";
        mia-pi-git = "Mia";
        monsanto = "chaos";
        PartMan7 = "PartMan";
        QuiteQuiet = "Quite Quiet";
        scheibo = "pre";
        Spandamn = "Spandan";
        TheImmortal = "The Immortal";
        TheJetOU = "jetou";
        TheMezStrikes = "Felucia";
        xInstruct = "Instruct";
      };
    };
    script = let
      config = {
        rooms = ["development"];
        simple_rooms = ["staff"];
        secret = "$SECRET";
      };
    in
    ''
      export PSDEVBOT_PROJECT_CONFIGURATION='${builtins.replaceStrings ["$SECRET"] ["'\"$SECRET\"'"] (builtins.toJSON {
        "smogon/pokemon-showdown" = config;
        "smogon/pokemon-showdown-client" = config;
      })}'
      exec ${import ../packages/psdevbot-rust.nix}/bin/psdevbot
    '';
    serviceConfig = {
      DynamicUser = true;
      EnvironmentFile = "/var/lib/keys/psdevbot-rust";
      Restart = "always";
      RestartSec = "5s";
    };
  };

  imports = [ ./nginx.nix ];
}
