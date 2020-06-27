#
# Copyright 2020 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/oneplus/oneplus6/oneplus6-vendor.mk)

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vbmeta

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# Bluetooth
PRODUCT_PACKAGES += \
    libbluetooth_qti \
    libbt-logClient.so

# Common
TARGET_BOARD_PLATFORM := sdm845
$(call inherit-product, device/oneplus/common/common.mk)

# Common init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.post_boot.sh \
    ueventd.qcom.rc

# Display Calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qdcm_calib_data_samsung_s6e3fc2x01_cmd_mode_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/qdcm_calib_data_samsung_s6e3fc2x01_cmd_mode_dsi_panel.xml \
    $(LOCAL_PATH)/configs/qdcm_calib_data_samsung_sofef00_m_cmd_mode_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/qdcm_calib_data_samsung_sofef00_m_cmd_mode_dsi_panel.xml

# Fingerprint
PRODUCT_COPY_FILES += \
    vendor/pa/config/permissions/vendor.pa.biometrics.fingerprint.inscreen.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/vendor.pa.biometrics.fingerprint.inscreen.xml

PRODUCT_PACKAGES += \
    pa.biometrics.fingerprint.inscreen@1.0-service.oneplus_oneplus6

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gf_input.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/gf_input.idc \
    $(LOCAL_PATH)/configs/gf_input.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gf_input.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.oneplus_sdm845

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2 \
    android.hardware.secure_element@1.0 \
    com.android.nfc_extras \
    Tag \
    vendor.nxp.nxpese@1.0 \
    vendor.nxp.nxpnfc@1.0

# Performance
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/msm_irqbalance.conf \
    $(LOCAL_PATH)/configs/perfconfigstore.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/perf/perfconfigstore.xml \
    $(LOCAL_PATH)/configs/android.hardware.graphics.composer@2.3-service.rc:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/android.hardware.graphics.composer@2.3-service.rc

# QTI common
TARGET_COMMON_QTI_COMPONENTS := \
    audio \
    display \
    av \
    bt \
    perf \
    telephony \
    wfd

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm845 \
    libcutils \
    librecovery_updater_msm \
    libz \

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29

# VNDK-SP
PRODUCT_PACKAGES += \
    vndk-sp

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/wifi/WCNSS_qcom_cfg.ini \

# Common RRO Overlays
PRODUCT_PACKAGES += \
    OnePlus6SeriesBluetooth \
    OnePlus6SeriesCarrierConfig \
    OnePlus6SeriesFramework \
    OnePlus6SeriesSystemUI \
    OnePlus6SeriesTelephony

# Variant-specific RRO overlays
PRODUCT_PACKAGES += \
    OnePlus6Frameworks \
    OnePlus6SystemUI \
    OnePlus6TFrameworks \
    OnePlus6TSettings \
    OnePlus6TSystemUI

# Add option to disable notch
PRODUCT_PACKAGES += \
    NoCutoutOverlay

# Disable OnePlus shape icon overlays
PRODUCT_PACKAGES += \
    OnePlusIconShapeCircleOverlay \
    OnePlusIconShapeRoundedRectOverlay \
    OnePlusIconShapeSquareOverlay \
    OnePlusIconShapeSquircleOverlay \
    OnePlusIconShapeTeardropOverlay
