#!/bin/sh

if [ ! -d dldt ]; then
    git clone https://github.com/opencv/dldt

    pushd dldt > /dev/null
    patch -p1 < ../dldt-no-boot.patch
    popd > /dev/null
fi

rm include/*.h lib/*.c

cp dldt/inference-engine/thirdparty/movidius/mvnc/src/mvnc_{api,data}.c lib
cp dldt/inference-engine/thirdparty/movidius/mvnc/include/*.h include
cp dldt/inference-engine/thirdparty/movidius/XLink/shared/*.h include
cp dldt/inference-engine/thirdparty/movidius/XLink/pc/{pcie_host.h,usb_boot.h} include
cp dldt/inference-engine/thirdparty/movidius/watchdog/watchdog.h include
cp dldt/inference-engine/thirdparty/movidius/shared/include/*.h include

cp dldt/inference-engine/thirdparty/movidius/XLink/shared/{XLink.c,XLinkDispatcher.c} lib
cp dldt/inference-engine/thirdparty/movidius/XLink/pc/{XLinkPlatform.c,usb_boot.c,pcie_host.c} lib
cp dldt/inference-engine/thirdparty/movidius/shared/src/mvStringUtils.c lib

rm -fv ltmain.sh config.sub config.guess config.h.in
aclocal -I m4
autoheader
automake --add-missing --copy
autoreconf
chmod 755 configure

#gcc -DNO_BOOT=1 -I /usr/include/libusb-1.0 -Wall -I /usr/include/libusb-1.0 -I ../include  myriadctl.c ../lib/*.c -lusb-1.0 -lpthread -ldl -o myriadctl
