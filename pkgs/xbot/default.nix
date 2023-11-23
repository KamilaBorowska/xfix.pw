# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  naersk,
  src,
  pkg-config,
  cairo,
  pango,
  openssl,
}:
naersk.buildPackage {
  inherit src;
  nativeBuildInputs = [pkg-config];
  buildInputs = [cairo pango openssl];
}
