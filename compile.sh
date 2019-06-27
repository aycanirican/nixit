#!/usr/bin/env bash

DISTRO="https://github.com/aycanirican/nixit/archive/master.tar.gz"
NAME="example"
VERSION="0.0.1"

nix build -f "$DISTO" \
    --argstr name     "$NAME" \
    --argstr version  "$VERSION" \
    --argstr deps "$(cat .nixit.deps | xargs)"


