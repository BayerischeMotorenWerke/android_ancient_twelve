#!/bin/bash

gclang=prebuilts/clang/host/linux-x86/gabuters-clang

if [ ! -d $gclang ]; then
echo "Gabuters clang is empty! cloning.."
git clone https://github.com/Gabuters-Dev/gabuters-clang $gclang
else
echo "Gabuters clang exist, skipping.."
fi

rm -rf hardware/qcom-caf/msm8996/{audio,media,display}
git clone https://github.com/ItsVixano/hardware_qcom-caf -b display-msm8996-s hardware/qcom-caf/msm8996/display
git clone https://github.com/glassydan/hardware_qcom-caf_msm8996-r_media -b eleven hardware/qcom-caf/msm8996/media
git clone https://github.com/glassydan/android_hardware_qcom_audio -b lineage-18.1-caf-msm8996 hardware/qcom-caf/msm8996/audio
cd hardware/qcom-caf/msm8996/display; git revert 3278ed4a4d3646238702404816377abfa27ed91c
