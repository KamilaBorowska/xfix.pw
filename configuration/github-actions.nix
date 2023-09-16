# SPDX-FileCopyrightText: 2023 Konrad Borowski <konrad@borowski.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  users.users.github-actions = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG1Fi8eQ/COrcxBSPbNonJVU9Xzxv2fxyjnjzcsQhKtj"
    ];
  };
  nix.settings.trusted-users = ["github-actions"];
}
