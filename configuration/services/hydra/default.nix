# SPDX-FileCopyrightText: 2024 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  imports = [../nginx];
  services.hydra = {
    enable = true;
    port = 3001;
    hydraURL = "https://hydra.xfix.pw";
    notificationSender = "hydra@localhost";
    useSubstitutes = true;
  };
  nix = {
    buildMachines = [
      {
        hostName = "localhost";
        system = "x86_64-linux";
        supportedFeatures = ["kvm" "nixos-test"];
      }
    ];
    extraOptions = ''
      allowed-uris = https://codeberg.org/
    '';
    settings.experimental-features = ["nix-command" "flakes"];
  };
  services.nginx.virtualHosts."hydra.xfix.pw" = {
    enableACME = true;
    forceSSL = true;
    locations."/".proxyPass = "http://127.0.0.1:3001";
  };
}
