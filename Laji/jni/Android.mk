 LOCAL_PATH := $(call my-dir)

 include $(CLEAR_VARS)

 LOCAL_MODULE    := native
 LOCAL_SRC_FILES := native.c
 LOCAL_LDLIBS := -llog -ljnigraphics -lz 

 LOCAL_SHARED_LIBRARIES := libavformat libavcodec libswscale libavutil libpostproc libavfilter libswresample

 include $(BUILD_SHARED_LIBRARY)
 
 #because I place the so files under NDK/sources/, the build system could find them.
 $(call import-module,ffmpeg-2.5.3/android/arm)
