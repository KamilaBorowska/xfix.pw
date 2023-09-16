# SPDX-FileCopyrightText: 2023 Konrad Borowski <konrad@borowski.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  imports = [../nginx];

  services.nginx = {
    virtualHosts = {
      "i.xfix.pw" = {
        enableACME = true;
        forceSSL = true;
        root = "/var/i.xfix.pw";
      };
    };
  };
}
