# SPDX-FileCopyrightText: 2023 Konrad Borowski <konrad@borowski.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };
}
