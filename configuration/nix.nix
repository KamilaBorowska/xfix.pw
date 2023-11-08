# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;
}
