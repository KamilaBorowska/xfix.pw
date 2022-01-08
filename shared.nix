{ pkgs, ... }:
{
  services.openssh = {
    kexAlgorithms = [ "curve25519-sha256@libssh.org" ];
    extraConfig = "AuthenticationMethods publickey";
  };
  services.postgresql.package = pkgs.postgresql_14;
  networking.firewall.allowedTCPPorts = [ 25 80 443 ];
}
