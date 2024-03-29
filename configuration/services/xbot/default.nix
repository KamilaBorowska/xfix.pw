# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{pkgs, ...}: {
  systemd.services.xbot = {
    wantedBy = ["multi-user.target"];
    after = ["network-online.target"];
    enable = true;
    environment.SANDBOX_URL = "http://localhost:8082";
    environment.RUST_LOG = "warn";
    script = "${pkgs.xbot}/bin/xbot";
    serviceConfig = {
      DynamicUser = true;
      EnvironmentFile = "/var/lib/keys/xbot";
    };
  };
  fonts.packages = with pkgs; [noto-fonts noto-fonts-cjk noto-fonts-emoji];
}
