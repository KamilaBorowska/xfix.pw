{ pkgs, ... }:
{
  systemd.services.zfsbackup = {
    serviceConfig = {
      EnvironmentFile = "/var/lib/keys/zfsbackup";
      Type = "oneshot";
    };
    path = [ pkgs.zfs pkgs.zfsbackup ];
    script = ''
      newest_snapshot="$(zfs list -H -p -t snapshot -o name,creation -S creation rpool/root/var | grep daily | head -1 | cut -f 1)"
      zfsbackup-go send --fullIfOlderThan 360h --replication "$newest_snapshot" b2://xfix-pw
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
