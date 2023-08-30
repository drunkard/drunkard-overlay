# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit eutils gnome2-utils pax-utils unpacker xdg-utils

DESCRIPTION="Netease cloud music client"
HOMEPAGE="http://music.163.com"
SRC_URI="
amd64? ( http://d1.music.126.net/dmusic/${PN}_${PV}_amd64_ubuntu.deb )
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror strip"

DEPEND=""
RDEPEND="
>=gnome-base/gconf-3.2.5
>=dev-db/sqlite-3.5.9
>=dev-libs/atk-1.12.4
>=dev-libs/expat-2.0.1
>=dev-libs/glib-2.31.8
>=dev-libs/nspr-4.9
>=dev-libs/nss-3.13.4
>=media-libs/fontconfig-2.10.0
>=media-libs/taglib-1.9.1
>=media-video/vlc-2.1.0
media-sound/pulseaudio
>=net-print/cups-1.3.0
>=sys-apps/dbus-1.8.1
>=sys-devel/gcc-5.2
>=sys-libs/glibc-2.15
>=sys-libs/zlib-1.1.4
>=x11-libs/cairo-1.2.4
>=x11-libs/gdk-pixbuf-2.22.0
>=x11-libs/gtk+-2.24.0:2
>=x11-libs/libX11-1.4.99.1
>=x11-libs/libxcb-1.6
>=x11-libs/libXcomposite-0.3
>=x11-libs/libXdamage-1.1
>=x11-libs/libXi-1.2.99.4
>=x11-libs/libXrandr-1.2.99.3
>=x11-libs/pango-1.14.0
>x11-libs/libXcursor-1.1.2
x11-libs/libXScrnSaver
x11-libs/libXext
x11-libs/libXfixes
x11-libs/libXrender
x11-libs/libXtst
"

S=${WORKDIR}

src_install() {
	insinto /usr/$(get_libdir)
	doins -r ${S}/usr/lib/${PN}

	dobin ${S}/usr/bin/${PN}

	for f in /usr/$(get_libdir)/${PN}/lib/*; do
		[ -f "$f" ] && [ ! -L "$f" ] && fperms 0755 "$f"
	done

	insinto /usr/
	doins -r ${S}/usr/share

}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
