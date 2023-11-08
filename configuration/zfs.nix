# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  networking.hostId = "24d3770b";
  services.zfs.autoScrub.enable = true;
  services.zfs.autoSnapshot = {
    enable = true;
    monthly = 1;
  };
}
