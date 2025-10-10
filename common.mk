#Common headers
display_top := $(call my-dir)

#Common C flags
common_flags := -Wno-missing-field-initializers
common_flags += -Wall -Werror

#Common libraries external to display HAL
common_libs := liblog libutils libcutils libhardware
common_deps  :=
kernel_includes :=

ifeq ($(TARGET_COMPILE_WITH_MSM_KERNEL),true)
# This check is to pick the kernel headers from the right location.
# If the macro above is defined, we make the assumption that we have the kernel
# available in the build tree.
# If the macro is not present, the headers are picked from hardware/qcom/msmXXXX
# failing which, they are picked from bionic.
    kernel_includes += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
    common_deps += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
endif
