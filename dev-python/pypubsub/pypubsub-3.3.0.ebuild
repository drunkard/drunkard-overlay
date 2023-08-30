# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

MY_HASH="1801be1a63af9250e79b8941a37b88e3ca0d660b880b9862fe9016ae6a3a"
MY_PN="PyPubSub"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A Python publish-subcribe library"
HOMEPAGE="https://github.com/pauldmccarthy/indexed_gzip"
SRC_URI="
	https://files.pythonhosted.org/packages/95/5a/${MY_HASH}/${MY_P}.zip -> ${P}.zip
	"
	#https://github.com/schollii/pypubsub/archive/${EGIT_COMMIT}.tar.gz -> ${P}-extras.tar.gz

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="test? (	dev-python/nose[${PYTHON_USEDEP}] )"
RDEPEND=""

S="${WORKDIR}/${MY_P}"

#PATCHES=( "${FILESDIR}"/${P}-imports.patch )
#
#src_prepare() {
#	cp "../${PN}-${EGIT_COMMIT}/"{policies,py2and3}.py src/ || die
#	cp "../${PN}-${EGIT_COMMIT}/setuparg1.py" src/pubsub/core/ || die
#	cp "../${PN}-${EGIT_COMMIT}/setupkwargs.py" src/pubsub/core/ || die
#	cp "../${PN}-${EGIT_COMMIT}/core/arg1/listenerimpl.py" src/pubsub/core/ || die
#	cp "../${PN}-${EGIT_COMMIT}/core/arg1/publisher.py" src/pubsub/core/ || die
#	cp "../${PN}-${EGIT_COMMIT}/core/arg1/publishermixin.py" src/pubsub/core/ || die
#	cp "../${PN}-${EGIT_COMMIT}/core/arg1/topicargspecimpl.py" src/pubsub/core/ || die
#	cp "../${PN}-${EGIT_COMMIT}/core/arg1/topicmgrimpl.py" src/pubsub/core/ || die
#	cp "../${PN}-${EGIT_COMMIT}/core/listenerbase.py" src/pubsub/core/ || die
#	cp "../${PN}-${EGIT_COMMIT}/core/publisherbase.py" src/pubsub/core/ || die
#	cp "../${PN}-${EGIT_COMMIT}/core/treeconfig.py" src/pubsub/core/ || die
#	cp "../${PN}-${EGIT_COMMIT}/core/validatedefnargs.py" src/pubsub/core/ || die
#	touch __init__.py
#	find -type f -exec sed -i\
#		-e "s/from .. import policies/import policies/g"\
#		-e "s/from .. import py2and3/import py2and3/g"\
#		{} + || die
#	distutils-r1_src_prepare
#}

#src_compile() {
#	distutils-r1_src_compile
#	ls
#	cp "../${PN}-${EGIT_COMMIT}/"{policies,py2and3}.py ${BUILD_DIR} || die
#}

python_test() {
	#cp "../${PN}-${EGIT_COMMIT}/"{policies,py2and3}.py "${BUILD_DIR}" || die
	#cp "../${PN}-${EGIT_COMMIT}/"{policies,py2and3}.py src/ || die
	cd ${BUILD_DIR} || die
	nosetests -v || die
	#for i in tests/suite/*.py; do
	#	echo "Executing ${EPYTHON} ${i}"
	#	${EPYTHON} "$i" || die "Example Python script $i failed with ${EPYTHON}"
	#done
}
