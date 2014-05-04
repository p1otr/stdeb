#!/bin/bash
set -e

# Package with source tarball on PyPI:
pypi-install pyflakes --verbose=2
sudo dpkg --purge python-pyflakes

# Package with no source tarball on PyPI: (v 0.6.2, 2009-12-30)
pypi-install posix_ipc --release=0.6.2 --verbose=2 --allow-unsafe-download
sudo dpkg --purge python-posixipc

echo "skipping known failure tests"
exit 0

#  A pure python package with source tarball on PyPI.  (This fails if
#   the Debian/Ubuntu original "pyro" package is already
#   installed. This should use apt-file to find that binary package is
#   "pyro".)
sudo apt-get install pyro # get upstream version
pypi-install Pyro --verbose=2
