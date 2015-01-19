#!/bin/bash
NDK=$HOME/Downloads/android-ndk-r10d

#use a different api level fi your min sdk version is not 8
SYSROOT=$NDK/platforms/android-8/arch-arm/

#change the value based on you ndk and system
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64

CPU=arm
PREFIX=./android/$CPU
#ADDI_CFLAGS="-marm "
ADDI_CFLAGS="-marm "
ADDI_LDFLAGS=""

#function build_one
#{
  echo $PREFIX
    ./configure \
    --prefix=$PREFIX \
    --enable-shared \
    --enable-pic \
    --disable-doc \
    --disable-ffmpeg \
    --disable-asm \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-static \
    --disable-ffserver \
    --disable-avdevice \
    --disable-doc \
    --disable-symver \
    --enable-gpl \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --target-os=linux \
    --arch=arm \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --extra-cflags="-Os -fpic $ADDI_CFLAGS" \
    --extra-ldflags="$ADDI_LDFLAGS" \
    $ADDITIONAL_CONFIGURE_FLAG
make clean
make -j6
make install
#}
