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

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@5.0 \
    android.hardware.audio.common@5.0 \
    android.hardware.audio.common@5.0-util \
    android.hardware.audio.effect@5.0 \
    libaudio-resampler \
    libaudiohal \
    libaudiohal_deathhandler \
    libstagefright_softomx

# Bluetooth
PRODUCT_PACKAGES += \
    libbluetooth_qti \
    libbt-logClient.so

# Boot control
PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Common init scripts
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.qcom.post_boot.sh \
    ueventd.qcom.rc

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libqdMetaData.system

# Display Calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qdcm_calib_data_samsung_s6e3fc2x01_cmd_mode_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/qdcm_calib_data_samsung_s6e3fc2x01_cmd_mode_dsi_panel.xml \
    $(LOCAL_PATH)/configs/qdcm_calib_data_samsung_sofef00_m_cmd_mode_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/qdcm_calib_data_samsung_sofef00_m_cmd_mode_dsi_panel.xml

# Fingerprint
PRODUCT_COPY_FILES += \
    vendor/pa/config/permissions/vendor.pa.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.pa.biometrics.fingerprint.inscreen.xml

PRODUCT_PACKAGES += \
    pa.biometrics.fingerprint.inscreen@1.0-service.oneplus_fajita

# Hotword enrollment
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:system/etc/permissions/privapp-permissions-hotword.xml

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gf_input.idc:system/usr/idc/gf_input.idc \
    $(LOCAL_PATH)/configs/gf_input.kl:system/usr/keylayout/gf_input.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.oneplus_sdm845

# Media
PRODUCT_PACKAGES += \
    libmediaplayerservice

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0 \
    android.hardware.nfc@1.1 \
    android.hardware.nfc@1.2 \
    android.hardware.secure_element@1.0 \
    com.android.nfc_extras \
    Tag \
    vendor.nxp.nxpese@1.0 \
    vendor.nxp.nxpnfc@1.0

# NN
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-rtti

# Performance
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/msm_irqbalance.conf \
    $(LOCAL_PATH)/configs/perfconfigstore.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/perf/perfconfigstore.xml \
    $(LOCAL_PATH)/configs/android.hardware.graphics.composer@2.3-service.rc:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/init/android.hardware.graphics.composer@2.3-service.rc

# Power
PRODUCT_PACKAGES += \
    power.qcom

# QTI common
TARGET_COMMON_QTI_COMPONENTS := \
    av \
    bt \
    perf \
    telephony \
    wfd

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.0 \
    android.hardware.radio@1.1 \
    android.hardware.radio@1.2 \
    android.hardware.radio@1.3 \
    android.hardware.radio@1.4 \
    android.hardware.radio.config@1.0 \
    android.hardware.radio.deprecated@1.0

# tri-state-key
PRODUCT_PACKAGES += \
    TriStateHandler \
    tri-state-key_daemon

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

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

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
    SDM845CommonBluetoothRes \
    SDM845CommonCarrierConfigRes \
    SDM845CommonFrameworkRes \
    SDM845CommonFrameworkPARes \
    SDM845CommonSystemUIPARes \
    SDM845CommonTelephonyRes

# Variant-specific RRO overlays
PRODUCT_PACKAGES += \
    OnePlus6FrameworksRes \
    OnePlus6SystemUI \
    OnePlus6TFrameworksRes \
    OnePlus6TSettingsPARes \
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

# ParanoidDoze
PRODUCT_PACKAGES += ParanoidDoze
