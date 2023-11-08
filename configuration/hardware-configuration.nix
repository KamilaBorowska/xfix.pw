# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot.initrd.availableKernelModules = ["ata_piix" "virtio_pci" "xhci_pci" "sd_mod" "sr_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "rpool/root/nixos";
    fsType = "zfs";
  };

  fileSystems."/etc" = {
    device = "rpool/root/etc";
    fsType = "zfs";
  };

  fileSystems."/nix" = {
    device = "rpool/root/nix";
    fsType = "zfs";
  };

  fileSystems."/var" = {
    device = "rpool/root/var";
    fsType = "zfs";
  };

  fileSystems."/home" = {
    device = "rpool/root/home";
    fsType = "zfs";
  };

  fileSystems."/var/lib/postgresql" = {
    device = "rpool/root/var/postgresql";
    fsType = "zfs";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/e5c1ace0-52cf-486d-9ae9-61b9f0d1333e";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.ens3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
