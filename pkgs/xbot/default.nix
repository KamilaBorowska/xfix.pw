# SPDX-FileCopyrightText: 2023 Kamila Borowska <kamila@borowska.pw>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
{
  naersk,
  src,
  pkgconfig,
  cairo,
  pango,
  openssl,
}:
naersk.buildPackage {
  inherit src;
  nativeBuildInputs = [pkgconfig];
  buildInputs = [cairo pango openssl];
}
