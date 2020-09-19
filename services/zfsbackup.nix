{ pkgs, ... }:
{
  systemd.services.zfsbackup = {
    path = [ pkgs.zfs ];
    serviceConfig = {
      EnvironmentFile = "/var/lib/keys/zfsbackup";
      Type = "oneshot";
      ExecStart = "${pkgs.zfsbackup}/bin/zfsbackup-go send --fullIfOlderThan 360h --replication rpool/root/var b2://xfix-pw";
    };
  };

  systemd.timers.zfsbackup = {
    timerConfig = {
      OnCalendar = "0,12:05";
      Persistent = "true";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
