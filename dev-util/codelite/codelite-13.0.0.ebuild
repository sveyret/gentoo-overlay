# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils eapi7-ver wxwidgets

DESCRIPTION="A Free, open source, cross platform C, C++, PHP and Node.js IDE"
HOMEPAGE="http://codelite.org/"
MY_GIT_SITE="https://codeload.github.com/eranif"
[[ $(ver_cut 3) -eq 0 ]] && MY_VERSION=$(ver_cut 1-2)
MY_VERSION=$(ver_rs 2 '-' "${MY_VERSION}")
SRC_URI="${MY_GIT_SITE}/${PN}/tar.gz/${MY_VERSION} -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

KEYWORDS="~amd64 ~x86"

RDEPEND=">=x11-libs/wxGTK-3.0.0:3.0 net-libs/libssh"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${MY_VERSION}"

src_prepare() {
	WX_GTK_VER=3.0 setup-wxwidgets
	eapply_user
}
