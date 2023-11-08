# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{pkgs, ...}: {
  users.users.xfix = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ7GBke6Y5m3z4VtiQPzQjVGnPLi6/XwFMNuNtVnL6vM"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK8rVxv/PJRJPXrsbaOL/aR7W9TPsGyjfV2Y+HutuDoH"
    ];
  };
  programs.fish.enable = true;
  security.sudo.wheelNeedsPassword = false;
}
