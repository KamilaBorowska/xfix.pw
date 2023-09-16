# SPDX-FileCopyrightText: 2023 Konrad Borowski <konrad@borowski.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  nix.settings = {
    substituters = [
      "https://xfix-pw.cachix.org"
    ];
    trusted-public-keys = [
      "xfix-pw.cachix.org-1:zjX5rVK971uU79R2etsxFDEiC5CBbAS9dw3t1Vrk7/U="
    ];
  };
}
