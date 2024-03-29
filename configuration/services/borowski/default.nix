# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  services.nginx.virtualHosts = {
    "borowski.pw" = {
      enableACME = true;
      forceSSL = true;
      globalRedirect = "www.borowski.pw";
    };
    "www.borowski.pw" = {
      enableACME = true;
      forceSSL = true;
      root = ./root;
    };
  };

  imports = [../nginx];
}
