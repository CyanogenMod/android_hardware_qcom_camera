ifeq ($(call my-dir),$(call project-path-for,qcom-camera))

ifneq ($(strip $(USE_DEVICE_SPECIFIC_CAMERA)),true)
ifneq ($(filter msm8960 msm8916 msm8610 msm_bronze msm8226 msm8974,$(TARGET_BOARD_PLATFORM)),)
  ifneq ($(USE_CAMERA_STUB),true)
    ifneq ($(BUILD_TINY_ANDROID),true)
      include $(call all-subdir-makefiles)
    endif
  endif
endif
endif

endif
