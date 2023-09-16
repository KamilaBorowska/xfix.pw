# SPDX-FileCopyrightText: 2023 Konrad Borowski <konrad@borowski.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{pkgs, ...}: {
  imports = [../nginx];

  services.nginx.virtualHosts."www.xfix.pw" = {
    enableACME = true;
    forceSSL = true;
    locations."/api/babelmark/pulldown-cmark".proxyPass = "http://127.0.0.1:8081";
  };

  systemd.services.babelmark = {
    wantedBy = ["multi-user.target"];
    enable = true;
    environment.ROCKET_PORT = "8081";
    script = "${pkgs.pulldown-cmark-babelmark}/bin/pulldown-cmark-babelmark";

    serviceConfig = {
      DynamicUser = true;
      CapabilityBoundingSet = "";
      RestrictAddressFamilies = "AF_INET";
      RestrictNamespaces = true;
      PrivateDevices = true;
      PrivateUsers = true;
      ProtectControlGroups = true;
      ProtectHome = true;
      ProtectKernelModules = true;
      ProtectKernelTunables = true;
      SystemCallArchitectures = "native";
      SystemCallFilter = "@system-service";
      Restart = "always";
    };
  };
}
