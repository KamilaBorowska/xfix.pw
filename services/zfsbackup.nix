{ pkgs, ... }:
let
  zfsbackup = import ../packages/zfsbackup-go;
in
{
  systemd.services.zfsbackup = {
    serviceConfig = {
      EnvironmentFile = "/var/lib/keys/zfsbackup";
      Type = "oneshot";
    };
    path = [ pkgs.zfs zfsbackup ];
    script = ''
      zfsbackup-go send --fullIfOlderThan 360h --replication --snapshotPrefix zfs-auto-snap_daily- rpool/root/var b2://xfix-pw
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
