LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        QCamera3Factory.cpp \
        QCamera3Hal.cpp \
        QCamera3HWI.cpp \
        QCamera3Mem.cpp \
        QCamera3Stream.cpp \
        QCamera3Channel.cpp \
        QCamera3PostProc.cpp \
        ../util/QCameraCmdThread.cpp \
        ../util/QCameraQueue.cpp

LOCAL_CFLAGS := -Wall -Werror
LOCAL_CFLAGS += -DHAS_MULTIMEDIA_HINTS

ifneq ($(TARGET_QCOM_MEDIA_VARIANT),)
MEDIA := media-$(TARGET_QCOM_MEDIA_VARIANT)
else
MEDIA := media
endif

LOCAL_C_INCLUDES := \
        $(LOCAL_PATH)/../stack/common \
        frameworks/native/include/media/openmax \
        frameworks/native/include \
        frameworks/av/include \
        hardware/qcom/$(MEDIA)/libstagefrighthw \
        system/media/camera/include \
        $(LOCAL_PATH)/../../mm-image-codec/qexif \
        $(LOCAL_PATH)/../../mm-image-codec/qomx_core \
        $(LOCAL_PATH)/../util

ifneq ($(TARGET_QCOM_DISPLAY_VARIANT),)
DISPLAY := display-$(TARGET_QCOM_DISPLAY_VARIANT)
else
ifneq ($(filter msm8974 msm8x74,$(TARGET_BOARD_PLATFORM)),)
DISPLAY := display/msm8974
else
DISPLAY := display/msm8960
endif
endif

LOCAL_C_INCLUDES += \
        hardware/qcom/$(DISPLAY)/libgralloc

LOCAL_SHARED_LIBRARIES := libcamera_client liblog libhardware libutils libcutils libdl
LOCAL_SHARED_LIBRARIES += libmmcamera_interface libmmjpeg_interface libui libcamera_metadata

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
#LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE := camera.$(TARGET_DEVICE)
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

#include $(LOCAL_PATH)/test/Android.mk
