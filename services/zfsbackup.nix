{ pkgs, ... }:
{
  systemd.services.zfsbackup = {
    serviceConfig = {
      EnvironmentFile = "/var/lib/keys/zfsbackup";
      Type = "oneshot";
    };
    path = [ pkgs.zfs pkgs.zfsbackup ];
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
