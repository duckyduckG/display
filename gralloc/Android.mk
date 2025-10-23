LOCAL_PATH := $(call my-dir)

include $(LOCAL_PATH)/../common.mk
include $(LIBION_HEADER_PATH_WRAPPER)
include $(CLEAR_VARS)

#allocator
include $(CLEAR_VARS)
LOCAL_MODULE                  := vendor.qti.hardware.display.allocator-service
LOCAL_SANITIZE                := integer_overflow
LOCAL_VENDOR_MODULE           := true
LOCAL_MODULE_RELATIVE_PATH    := hw
LOCAL_MODULE_TAGS             := optional
LOCAL_HEADER_LIBRARIES        := display_headers
LOCAL_SHARED_LIBRARIES        := $(common_libs) \
                                 libhidlbase \
                                 libqdMetaData \
                                 libgrallocutils \
                                 libgralloccore \
                                 libgralloctypes \
                                 vendor.qti.hardware.display.allocator@4.0 \
                                 vendor.qti.hardware.display.allocator@3.0 \
                                 vendor.qti.hardware.display.mapper@4.0 \
                                 vendor.qti.hardware.display.mapper@3.0 \
                                 android.hardware.graphics.mapper@4.0 \
                                 android.hardware.graphics.mapper@3.0 \
                                 android.hardware.graphics.mapper@2.1 \
                                 android.hardware.graphics.allocator@4.0 \
                                 android.hardware.graphics.allocator@3.0 \
                                 vendor.qti.hardware.display.mapperextensions@1.0 \
                                 vendor.qti.hardware.display.mapperextensions@1.1
LOCAL_CFLAGS                  := -DLOG_TAG=\"qdgralloc\" $(common_flags)
ifneq ($(TARGET_USES_GRALLOC4),false)
LOCAL_CFLAGS                  += -DTARGET_USES_GRALLOC4
endif
LOCAL_ADDITIONAL_DEPENDENCIES := $(common_deps)
LOCAL_C_INCLUDES              := $(common_includes) $(kernel_includes)
LOCAL_SRC_FILES               := QtiAllocator.cpp service.cpp
LOCAL_INIT_RC                 := vendor.qti.hardware.display.allocator-service.rc
LOCAL_VINTF_FRAGMENTS         := vendor.qti.hardware.display.allocator-service.xml
include $(BUILD_EXECUTABLE)
