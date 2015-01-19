 LOCAL_PATH := $(call my-dir)

 include $(CLEAR_VARS)

 LOCAL_MODULE    := native
 LOCAL_SRC_FILES := native.c
 LOCAL_LDLIBS := -llog -ljnigraphics -lz 
 LOCAL_SHARED_LIBRARIES := libavformat libavcodec libswscale libavutil libpostproc libavfilter libswresample
#LOCAL_SHARED_LIBRARIES := libpostproc libavutil 

 include $(BUILD_SHARED_LIBRARY)
 $(call import-module,ffmpeg-2.5.3/android/arm)