# Copyright (C) 2017 The Pure Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := vendor/pixelstyle

# Prebuilt Packages
PRODUCT_PACKAGES += \
    NexusWallpapersStubPrebuilt2019Static \
    ShiftPapers \
    SafetyHubPrebuilt \
    SettingsIntelligenceGooglePrebuilt

# Packages
PRODUCT_PACKAGES += \
    FluidThemesStub \
    EmptyOverlay


ifeq ($(TARGET_GAPPS_ARCH),arm64)
PRODUCT_PACKAGES += \
    MatchmakerPrebuiltPixel4
endif

ifeq ($(TARGET_OOS_RECORDER),true)
PRODUCT_PACKAGES += \
    OPScreenRecorder
endif

# Switch Styles
include vendor/pixelstyle/switch/switch.mk

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "PixelStyle: TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "PixelStyle: Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/bootanimation/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
endif

# Launcher Config
ifeq ($(TARGET_LAUNCHER_CHOICE),oplauncher)
include vendor/oplauncher/OPLauncher2.mk
else ifeq ($(TARGET_LAUNCHER_CHOICE),pixel)
PRODUCT_PACKAGES += \
     NexusLauncherRelease
else
     $(warning "Pixelstyle: TARGET_LAUNCHER_CHOICE is invalid or undefined, building Lawnchair")

include vendor/lawnchair/lawnchair.mk
endif

# Gestures
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural

# Gboard configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5 \
    ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms

# SetupWizard configuration
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.rotation_locked=true \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.theme=glif_v3_light \
    setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
    setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
    setupwizard.feature.show_pixel_tos=false

# StorageManager configuration
PRODUCT_PRODUCT_PROPERTIES += \
        ro.storage_manager.show_opt_in=false

# OPA configuration
PRODUCT_PRODUCT_PROPERTIES += \
        ro.opa.eligible_device=true

# Google legal
PRODUCT_PRODUCT_PROPERTIES += \
        ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
        ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html

#Primaries
PRODUCT_PACKAGES += \
        PrimaryColorAlmostBlackOverlay \
        PrimaryColorBlissOverlay \
        PrimaryColorOneplusDarkOverlay \
        PrimaryColorCharcoalBlackOverlay \
        PrimaryColorLeadBlackOverlay \
        PrimaryEtherealOverlay \
        PrimaryColorDerpClearOverlay \
	PrimaryColorBlackOverlay    

#Accents
PRODUCT_PACKAGES += \
	AccentColorDarkOrangeOverlay \
	AccentColorMIUIOverlay \
        AccentColorNextbitOverlay \
	AccentColorOnePlusOverlay \
	AccentColorParanoidOverlay \
        AccentColorShapeShifterOverlay \
	AccentColorPepsiOverlay \
	AccentColorTealOverlay \
	AccentColorRedOverlay \
	AccentColorQGreenOverlay \
	AccentColorPinkOverlay \
	AccentColorLightPurpleOverlay \
	AccentColorIndigoOverlay \
	AccentColorFlatPinkOverlay \
	AccentColorCyanOverlay \
	AccentColorBlueGrayOverlay \
        AccentColorCocaColaOverlay \
	AccentColorDiscordOverlay \
	AccentColorGoldenShowerOverlay \
	AccentColorJollibeeOverlay \
        AccentColorRazerOverlay \
        AccentColorStarbucksOverlay \
	AccentColorUbuntuOverlay \
	AccentColorMatrixOverlay \
	AccentColorSalmonOverlay \
	AccentColorMetallicGoldOverlay \
	AccentColorInfernoRedOverlay \
	AccentColorDorsetGoldOverlay \
	AccentColorXboxOverlay \
	AccentColorXiaomiOverlay \
	AccentColorBlackOverlay \
	AccentColorCinnamonOverlay \
        AccentColorCoralOverlay \
	AccentColorFerrariRedOverlay \
	AccentColorOceanOverlay \
	AccentColorOrchidOverlay \
	AccentColorSpaceOverlay \
	AccentColorGreenOverlay \
	AccentColorPurpleOverlay 

#IconShapes
PRODUCT_PACKAGES += \
        IconShapeCylinderOverlay \
	IconShapeHexagonOverlay \
	IconShapeRoundedHexagonOverlay \
	IconShapeRoundedRectOverlay \
	IconShapeSquircleOverlay \
	IconShapeTeardropOverlay \
	IconShapeVesselOverlay \
        IconShapeTaperedRectOverlay \
        IconShapePebbleOverlay 

# Google Play services configuration
PRODUCT_PRODUCT_PROPERTIES += \
        ro.com.google.clientidbase=android-google \
        ro.error.receiver.system.apps=com.google.android.gms \
        ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent

# Include product overlays
PRODUCT_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Inherit from audio config
$(call inherit-product, vendor/pixelstyle/config/audio.mk)

# Inherit from fonts config
$(call inherit-product, vendor/pixelstyle/config/fonts.mk)

#Fonts
PRODUCT_COPY_FILES += \
    vendor/pixelstyle/fonts/CircularStd.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/CircularStd.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Black.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SlateForOnePlus-Black.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SlateForOnePlus-Bold.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Book.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SlateForOnePlus-Book.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Light.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SlateForOnePlus-Light.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SlateForOnePlus-Medium.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SlateForOnePlus-Regular.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Thin.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SlateForOnePlus-Thin.ttf \
    vendor/pixelstyle/fonts/SFProDisplay-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SFProDisplay-Regular.ttf \
    vendor/pixelstyle/fonts/SFProDisplay-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SFProDisplay-Medium.ttf \
    vendor/pixelstyle/fonts/SFProText-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SFProText-Regular.ttf \
    vendor/pixelstyle/fonts/SFProText-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SFProText-Medium.ttf \
    vendor/pixelstyle/fonts/fontage/BigNoodleTilting-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/BigNoodleTilting-Italic.ttf \
    vendor/pixelstyle/fonts/fontage/BigNoodleTilting-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/BigNoodleTilting-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/din1451alt.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/din1451alt.ttf \
    vendor/pixelstyle/fonts/fontage/Hanken-Light.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Hanken-Light.ttf \
    vendor/pixelstyle/fonts/fontage/ReemKufi-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ReemKufi-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Cocon-RegularTR.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Cocon-RegularTR.ttf \
    vendor/pixelstyle/fonts/fontage/ComicNeue-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ComicNeue-Bold.ttf \
    vendor/pixelstyle/fonts/fontage/ComicNeue-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ComicNeue-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Exo2-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Exo2-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Exo2-SemiBold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Exo2-SemiBold.ttf \
    vendor/pixelstyle/fonts/fontage/Finlandica-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Finlandica-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Goodlight.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Goodlight.ttf \
    vendor/pixelstyle/fonts/fontage/Gravity-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Gravity-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Inter-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Inter-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Inter-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Inter-MediumItalic.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-RegularNarrow.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/LeagueMono-RegularNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-MediumNarrow.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/LeagueMono-MediumNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-BoldNarrow.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/LeagueMono-BoldNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-SemiBoldNarrow.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/LeagueMono-SemiBoldNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeonSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/LeonSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/mescla_regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/mescla_regular.ttf \
    vendor/pixelstyle/fonts/fontage/OdibeeSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/OdibeeSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Panamericana-Display.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Panamericana-Display.ttf \
    vendor/pixelstyle/fonts/fontage/PTSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/PTSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/PTMono-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/PTMono-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/routed-gothic-narrow.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/routed-gothic-narrow.ttf \
    vendor/pixelstyle/fonts/fontage/routed-gothic-narrow-half-italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/routed-gothic-narrow-half-italic.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SofiaSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSans-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SofiaSans-Medium.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSansSemiCond-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SofiaSansSemiCond-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSansSemiCond-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SofiaSansSemiCond-Medium.ttf \
    vendor/pixelstyle/fonts/EvolveSans.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/EvolveSans.ttf \
    vendor/pixelstyle/fonts/Linotte.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Linotte.ttf \
    vendor/pixelstyle/fonts/SamsungOne.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/SamsungOne.ttf \
    vendor/pixelstyle/fonts/FiraSans-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/FiraSans-Bold.ttf \
    vendor/pixelstyle/fonts/FiraSans-BoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/FiraSans-BoldItalic.ttf \
    vendor/pixelstyle/fonts/FiraSans-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/FiraSans-Italic.ttf \
    vendor/pixelstyle/fonts/FiraSans-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/FiraSans-Medium.ttf \
    vendor/pixelstyle/fonts/FiraSans-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/FiraSans-MediumItalic.ttf \
    vendor/pixelstyle/fonts/FiraSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/FiraSans-Regular.ttf 

#Fonts
PRODUCT_COPY_FILES += \
    vendor/pixelstyle/fonts/GoogleSans-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Regular.ttf \
    vendor/pixelstyle/fonts/GoogleSans-Medium.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Medium.ttf \
    vendor/pixelstyle/fonts/GoogleSans-MediumItalic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-MediumItalic.ttf \
    vendor/pixelstyle/fonts/GoogleSans-Italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Italic.ttf \
    vendor/pixelstyle/fonts/GoogleSans-Bold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Bold.ttf \
    vendor/pixelstyle/fonts/GoogleSans-BoldItalic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-BoldItalic.ttf \
    vendor/pixelstyle/fonts/CircularStd.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/CircularStd.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Black.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SlateForOnePlus-Black.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Bold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SlateForOnePlus-Bold.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Book.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SlateForOnePlus-Book.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Light.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SlateForOnePlus-Light.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Medium.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SlateForOnePlus-Medium.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SlateForOnePlus-Regular.ttf \
    vendor/pixelstyle/fonts/SlateForOnePlus-Thin.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SlateForOnePlus-Thin.ttf \
    vendor/pixelstyle/fonts/SFProDisplay-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SFProDisplay-Regular.ttf \
    vendor/pixelstyle/fonts/SFProDisplay-Medium.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SFProDisplay-Medium.ttf \
    vendor/pixelstyle/fonts/SFProText-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SFProText-Regular.ttf \
    vendor/pixelstyle/fonts/SFProText-Medium.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SFProText-Medium.ttf \
    vendor/pixelstyle/fonts/fontage/BigNoodleTilting-Italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/BigNoodleTilting-Italic.ttf \
    vendor/pixelstyle/fonts/fontage/BigNoodleTilting-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/BigNoodleTilting-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/din1451alt.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/din1451alt.ttf \
    vendor/pixelstyle/fonts/fontage/Hanken-Light.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Hanken-Light.ttf \
    vendor/pixelstyle/fonts/fontage/ReemKufi-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/ReemKufi-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Cocon-RegularTR.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Cocon-RegularTR.ttf \
    vendor/pixelstyle/fonts/fontage/ComicNeue-Bold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/ComicNeue-Bold.ttf \
    vendor/pixelstyle/fonts/fontage/ComicNeue-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/ComicNeue-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Exo2-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Exo2-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Exo2-SemiBold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Exo2-SemiBold.ttf \
    vendor/pixelstyle/fonts/fontage/Finlandica-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Finlandica-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Goodlight.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Goodlight.ttf \
    vendor/pixelstyle/fonts/fontage/Gravity-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Gravity-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Inter-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Inter-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Inter-MediumItalic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Inter-MediumItalic.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-RegularNarrow.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/LeagueMono-RegularNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-MediumNarrow.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/LeagueMono-MediumNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-BoldNarrow.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/LeagueMono-BoldNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeagueMono-SemiBoldNarrow.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/LeagueMono-SemiBoldNarrow.ttf \
    vendor/pixelstyle/fonts/fontage/LeonSans-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/LeonSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/mescla_regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/mescla_regular.ttf \
    vendor/pixelstyle/fonts/fontage/OdibeeSans-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/OdibeeSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/Panamericana-Display.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Panamericana-Display.ttf \
    vendor/pixelstyle/fonts/fontage/PTSans-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/PTSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/PTMono-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/PTMono-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/routed-gothic-narrow.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/routed-gothic-narrow.ttf \
    vendor/pixelstyle/fonts/fontage/routed-gothic-narrow-half-italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/routed-gothic-narrow-half-italic.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSans-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SofiaSans-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSans-Medium.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SofiaSans-Medium.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSansSemiCond-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SofiaSansSemiCond-Regular.ttf \
    vendor/pixelstyle/fonts/fontage/SofiaSansSemiCond-Medium.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SofiaSansSemiCond-Medium.ttf \
    vendor/pixelstyle/fonts/EvolveSans.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/EvolveSans.ttf \
    vendor/pixelstyle/fonts/Linotte.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Linotte.ttf \
    vendor/pixelstyle/fonts/SamsungOne.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SamsungOne.ttf \
    vendor/pixelstyle/fonts/FiraSans-Bold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/FiraSans-Bold.ttf \
    vendor/pixelstyle/fonts/FiraSans-BoldItalic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/FiraSans-BoldItalic.ttf \
    vendor/pixelstyle/fonts/FiraSans-Italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/FiraSans-Italic.ttf \
    vendor/pixelstyle/fonts/FiraSans-Medium.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/FiraSans-Medium.ttf \
    vendor/pixelstyle/fonts/FiraSans-MediumItalic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/FiraSans-MediumItalic.ttf \
    vendor/pixelstyle/fonts/FiraSans-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/FiraSans-Regular.ttf 

    # Volume Dialog plugins
    -include packages/apps/Plugins/plugins.mk
