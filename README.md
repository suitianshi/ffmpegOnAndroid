# ffmpegOnAndroid
the repository shows you how to build Ffmpeg library for use on Android

1. Prepare ffmpeg
if you don't have it by your hand, clone if from https://github.com/FFmpeg/FFmpeg.git, and here's the link of the repository: 
https://github.com/FFmpeg/FFmpeg. Please note that I am using ffmpeg-2.5.3 for the build, although I don't there will be much different using a different version. For some reason, I suggest you place the source files under NDK_PATH/sources/. Will explaint it later.

2. Prepare NDK.
i'm using android-ndk-r10d on linux 64bit. You can download if from developer site.

3. Once ffmpeg is ready, edit the *configur*e file and replace the following 4 lines:

SLIBNAME_WITH_MAJOR='$(SLIBNAME).$(LIBMAJOR)'
LIB_INSTALL_EXTRA_CMD='$$(RANLIB) "$(LIBDIR)/$(LIBNAME)"'
SLIB_INSTALL_NAME='$(SLIBNAME_WITH_VERSION)'
SLIB_INSTALL_LINKS='$(SLIBNAME_WITH_MAJOR) $(SLIBNAME)'

with : 

SLIBNAME_WITH_MAJOR='$(SLIBPREF)$(FULLNAME)-$(LIBMAJOR)$(SLIBSUF)'
LIB_INSTALL_EXTRA_CMD='$$(RANLIB) "$(LIBDIR)/$(LIBNAME)"'
SLIB_INSTALL_NAME='$(SLIBNAME_WITH_MAJOR)'
SLIB_INSTALL_LINKS='$(SLIBNAME)'

otherwise the lib name will not be compatible on Android.

4. Use the build.sh script to build ffmpeg. You should modify the options based on what you need. Here I want to use shared libraries.
