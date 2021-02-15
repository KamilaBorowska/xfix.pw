{ pkgs, ... }:
let
  zfsbackup = pkgs.callPackage (import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/c36bcb913047ca48c6c8d1a5fb65d91327544b33.tar.gz";
      sha256 = "1jdvbff0qcpnwpq6fj1x2ma37xyqh09ri90ig92pyaazx3y38mjw";
  } + "/pkgs/tools/backup/zfsbackup")) { };
in
{
  systemd.services.zfsbackup = {
    serviceConfig = {
      EnvironmentFile = "/var/lib/keys/zfsbackup";
      Type = "oneshot";
    };
    path = [ pkgs.zfs zfsbackup ];
    script = ''
      zfsbackup-go send --replication --fullIfOlderThan 360h --snapshotPrefix zfs-auto-snap_daily- rpool/root/var b2://xfix-pw
    '';
  };

  systemd.timers.zfsbackup = {
    timerConfig = {
      OnCalendar = "0:05";
      Persistent = "true";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
