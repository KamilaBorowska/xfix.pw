{ config, pkgs, ... }:
{
  services.postfix = {
    enable = true;
    config = {
      smtpd_milters = config.services.opendkim.socket;
      non_smtpd_milters = config.services.opendkim.socket;
      myhostname = "pastebin.run";
      smtp_tls_security_level = "may";
    };
    rootAlias = "postmaster@borowski.pw";
  };

  users.users.postfix.extraGroups = [ "opendkim" ];

  services.opendkim = {
    enable = true;
    group = "postfix";
    domains = "csl:pastebin.run";
    selector = "pastebin.run";
    configFile = pkgs.writeText "postfix.conf" ''
      UMask 0007
    '';
  };
}
