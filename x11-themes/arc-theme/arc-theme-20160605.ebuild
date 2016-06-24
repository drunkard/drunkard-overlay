# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id: $

EAPI=6

inherit autotools
MY_AUTHOR="horst3180"
MY_PN="arc-theme"

DESCRIPTION="a flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
HOMEPAGE="https://github.com/${MY_AUTHOR}/${MY_PN}"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/${MY_AUTHOR}/${MY_PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/${MY_AUTHOR}/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}-${PV}"
fi

# TODO remove unneeded files
# IUSE="cinnamon unity xfwm4"
LICENSE="GPL-3"
SLOT="0"

DEPEND=">=x11-libs/gtk+-3.14
	x11-themes/gtk-engines-murrine
	virtual/pkgconfig"
RDEPEND=">=x11-libs/gtk+-3.14
	x11-themes/gnome-themes-standard
	x11-themes/gtk-engines-murrine"

src_prepare(){
	eapply_user
	eautoreconf
}

src_install(){
	emake DESTDIR="${D}" install
}
