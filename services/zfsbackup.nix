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
      for path in rpool/root/var{,/postgresql}
      do
        zfsbackup-go send --fullIfOlderThan 360h --snapshotPrefix zfs-auto-snap_daily- "$path" b2://xfix-pw
      done
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
