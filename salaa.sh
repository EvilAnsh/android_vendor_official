# vendor/official/salaa.sh

# Repos required for salaa
declare -A DEVICE_REPOS=(
    ["device/realme/salaa"]="https://github.com/Matrixx-Devices/android_device_realme_salaa.git 15.0"
    ["vendor/realme/salaa"]="https://github.com/crdroidandroid/proprietary_vendor_realme_salaa 15.0"
    ["kernel/realme/salaa"]="https://github.com/crdroidandroid/android_kernel_realme_salaa 15.0"
    ["device/mediatek/sepolicy_vndr"]="https://github.com/yaap/device_mediatek_sepolicy_vndr.git sixteen"
    ["hardware/mediatek"]="https://github.com/LineageOS/android_hardware_mediatek.git lineage-22.2"
    ["hardware/oplus"]="https://github.com/LineageOS/android_hardware_oplus.git lineage-22.2"
    ["packages/apps/FMRadio"]="https://github.com/yaap/packages_apps_FMRadio.git sixteen"
)

# Paths to forcefully reclone (rm -rf and clone again)
FORCE_REMOVE=(
"packages/apps/FMRadio"
)
