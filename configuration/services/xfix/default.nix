# SPDX-FileCopyrightText: 2023 Konrad Borowski <konrad@borowski.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  imports = [../nginx];

  services.nginx = {
    virtualHosts = {
      "xfix.pw" = {
        enableACME = true;
        forceSSL = true;
        locations."/".return = "301 https://www.xfix.pw$request_uri";
      };
      "www.xfix.pw" = {
        enableACME = true;
        forceSSL = true;
        root = ./root;
      };
    };
  };
}
