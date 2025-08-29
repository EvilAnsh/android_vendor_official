# vendor/official/alioth.sh

# Example repos required for alioth
declare -A DEVICE_REPOS=(
    ["device/xiaomi/sm8250-common"]="https://github.com/custom-crdroid/device_xiaomi_sm8250-common.git"
    ["device/xiaomi/alioth"]="https://github.com/custom-crdroid/device_xiaomi_alioth"
    ["vendor/xiaomi/sm8250-common"]="https://github.com/custom-crdroid/vendor_xiaomi_sm8250-common.git"
    ["vendor/xiaomi/alioth"]="https://github.com/custom-crdroid/vendor_xiaomi_alioth.git"
    ["kernel/xiaomi/sm8250"]="https://github.com/re-noroi/kernel_sm8250.git"
    ["hardware/xiaomi"]="https://github.com/custom-crdroid/hardware_xiaomi.git"
    ["hardware/qcom-caf/sm8250/display"]="https://github.com/Sanjis-Android-Playground/hardware-qcom-caf-sm8250-displayLOS22.1.git"
    ["vendor/xiaomi/camera"]="https://gitlab.com/dark.phnx12/vendor_xiaomi_camera.git"
    ["prebuilts/clang/host/linux-x86/clang-r547379"]="https://gitlab.com/dark.phnx12/r547379.git"
)

# Paths to forcefully reclone (rm -rf and clone again)
FORCE_REMOVE=(
"hardware/xiaomi"
)
