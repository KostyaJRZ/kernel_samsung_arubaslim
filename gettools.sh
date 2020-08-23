#!/usr/bin/env bash

# Install build package for debian based linux
sudo apt install bc bash git-core gnupg build-essential \
    zip curl make automake autogen autoconf autotools-dev libtool shtool python \
    m4 gcc libtool zlib1g-dev flex bison libssl-dev

# Clone toolchain
git clone https://github.com/KostyaJRZ/arm-eabi-4.4.3.git
