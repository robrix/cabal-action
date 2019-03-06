#!/bin/sh
#
# Check the mounted repository for https://semver.org/ breaking changes.

set -eux

cabal new-update

sh -c "cabal $*"
