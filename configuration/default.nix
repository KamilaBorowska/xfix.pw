# SPDX-FileCopyrightText: 2023 Konrad Borowski <konrad@borowski.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  imports = [
    ./services
    ./grub.nix
    ./hardware-configuration.nix
    ./zfs.nix
    ./state-version.nix
    ./user.nix
    ./github-actions.nix
    ./nix.nix
  ];
}
