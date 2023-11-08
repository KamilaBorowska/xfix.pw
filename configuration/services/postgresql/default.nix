# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{pkgs, ...}: {
  services.postgresql.package = pkgs.postgresql_14;
}
