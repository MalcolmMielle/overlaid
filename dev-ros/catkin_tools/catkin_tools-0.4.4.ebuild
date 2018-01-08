# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5})
inherit distutils-r1

DESCRIPTION="catkin building tool for ros"

HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/catkin/catkin_tools/archive/0.4.4.tar.gz"

LICENSE="BSD"

KEYWORDS="~amd64"

SLOT="0"

RDEPEND="
        dev-python/catkin_pkg
        dev-ros/osrf_pycommon
        dev-python/pyyaml
        dev-python/setuptools
        dev-python/sphinxcontrib-programoutput
        dev-python/trollius
        "

DEPEND="${RDEPEND}"

python_prepare_all() {
    local PATCHES=(
        "${FILESDIR}"/jobserver_and_install_user.patch
        "${FILESDIR}"/test_install.patch
    )
    distutils-r1_python_prepare_all
}
