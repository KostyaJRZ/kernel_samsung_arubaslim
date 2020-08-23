#!/usr/bin/env bash

# Main environtment
KERNEL_DIR=$PWD
KERN_IMG=$KERNEL_DIR/out/arch/arm/boot/zImage
ZIP_DIR=$KERNEL_DIR/AnyKernel3
CONFIG=arubaslim_defconfig
CROSS_COMPILE="${PWD}/arm-eabi-4.7/bin/arm-eabi-"

# Export
export ARCH=arm
export CROSS_COMPILE

# Build start
mkdir $KERNEL_DIR/out
make O=out $CONFIG
make -j$(nproc --all) O=out \
                      ARCH=arm \

if ! [ -a $KERN_IMG ]; then
    echo "Build error!"
    exit 1
fi

cd $ZIP_DIR
make clean &>/dev/null
cd ..

cd $ZIP_DIR
cp $KERN_IMG zImage
make normal &>/dev/null
echo "Flashable zip generated under $ZIP_DIR."
cd ..
# Build end
