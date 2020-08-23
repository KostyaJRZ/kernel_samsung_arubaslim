export ARCH=arm
make arubaslim_defconfig
cp .config arch/arm/configs/arubaslim_defconfig
git commit -am "defconfig: arubaslim: Regenerate" --signoff
