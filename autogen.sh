#!/bin/sh

if [ ! -d dldt ]; then
    git clone https://github.com/opencv/dldt

    pushd dldt > /dev/null
    patch -p1 < ../dldt-no-watchdog.patch
    popd > /dev/null
fi

rm include/*.h lib/*.c

cp dldt/inference-engine/thirdparty/movidius/mvnc/src/mvnc_{api,data}.c lib
cp dldt/inference-engine/thirdparty/movidius/mvnc/include/*.h include
cp dldt/inference-engine/thirdparty/movidius/XLink/shared/include/*.h include
cp dldt/inference-engine/thirdparty/movidius/XLink/pc/protocols/{pcie_host.h,usb_boot.h} include
cp dldt/inference-engine/thirdparty/movidius/mvnc/include/watchdog/watchdog.h include

cp dldt/inference-engine/thirdparty/movidius/XLink/shared/src/*.c lib
cp dldt/inference-engine/thirdparty/movidius/XLink/pc/*.c lib
cp dldt/inference-engine/thirdparty/movidius/XLink/pc/protocols/*.c lib

rm -fv ltmain.sh config.sub config.guess config.h.in -r m4
mkdir -p m4
aclocal -I m4
autoheader
automake --add-missing --copy
autoreconf
chmod 755 configure

