{ pkgs, ... }:
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

  services.nginx = {
    enable = true;
    virtualHosts = {
      "i.xfix.pw" = {
        enableACME = true;
        forceSSL = true;
        root = "/var/lib/nextcloud/data/xfix/files/i.xfix.pw";
      };
    };
  };

  services.zfs.autoScrub.enable = true;
  services.zfs.autoSnapshot = {
    enable = true;
    monthly = 1;
  };

  users.users.xfix = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKShN/DjYQVzJwGMc/N/RjvZKBMrJeUpNN6oaxYTPHb0"
    ];
  };
}
