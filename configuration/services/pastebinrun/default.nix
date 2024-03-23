# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{pkgs, ...}: {
  services.nginx.virtualHosts = {
    "pastebin.run" = {
      enableACME = true;
      forceSSL = true;
      globalRedirect = "www.pastebin.run";
    };
    "www.pastebin.run" = {
      enableACME = true;
      forceSSL = true;
      root = ./root;
    };
  };
}
