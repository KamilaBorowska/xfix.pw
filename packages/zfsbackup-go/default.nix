with import <nixpkgs> {};

buildGoPackage rec {
  pname = "zfsbackup";
  version = "unstable-2020-06-16";
  rev = "18fea6e99f0a5a4c8513d3a3d1d45fb6750cfddf";

  goPackagePath = "github.com/someone1/zfsbackup-go";

  src = fetchFromGitHub {
    owner = "someone1";
    repo = "zfsbackup-go";
    inherit rev;
    sha256 = "1lmg1rjbzwam4g9470ba2hm7kmbf1mjl6q8s0y74789gxvr65xyp";
  };

  goDeps = ./deps.nix;

  meta = with lib; {
    description = "Backup ZFS snapshots to cloud storage such as Google, Amazon, Azure, etc";
    homepage = "https://github.com/someone1/zfsbackup-go";
    license = licenses.mit;
    maintainers = [ maintainers.xfix ];
  };
}
