TERMUX_PKG_HOMEPAGE=https://www.gnu.org/software/gawk/
TERMUX_PKG_DESCRIPTION="Programming language designed for text processing"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_DEPENDS="libandroid-support, libmpfr, libgmp, readline"
TERMUX_PKG_VERSION=5.0.0
TERMUX_PKG_SHA256=50f091ed0eb485ad87dbb620d773a3e2c31a27f75f5e008f7bf065055f024406
TERMUX_PKG_SRCURL=https://mirrors.kernel.org/gnu/gawk/gawk-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_RM_AFTER_INSTALL="bin/gawk-* bin/igawk share/man/man1/igawk.1"

termux_step_pre_configure() {
	# Remove old symlink to force a fresh timestamp:
	rm -f $TERMUX_PREFIX/bin/awk

	# http://cross-lfs.org/view/CLFS-2.1.0/ppc64-64/temp-system/gawk.html
	cp -v extension/Makefile.in{,.orig}
	sed -e 's/check-recursive all-recursive: check-for-shared-lib-support/check-recursive all-recursive:/' extension/Makefile.in.orig > extension/Makefile.in
}
