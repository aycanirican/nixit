#!/usr/bin/env bash

DISTRO="/Users/fxr/dev/nixit" # "https://github.com/aycanirican/nixit/archive/master.tar.gz"
NAME="example"
VERSION="0.0.1"

nix build -f "$DISTRO" \
    --argstr version  "$VERSION" \
    --argstr name     "$NAME" \
    --arg    packages '[ "aeson" "transformers" ]'

