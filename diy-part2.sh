#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 删除软件包
#rm -rf feeds/luci/applications/luci-app-zerotier
#rm -rf feeds/luci/applications/luci-app-socat
#rm -rf feeds/packages/net/v2ray-geodata
#rm -rf package/lean/autosamba

# autocore
#sed -i 's/DEPENDS:=@(.*/DEPENDS:=@(TARGET_bcm27xx||TARGET_bcm53xx||TARGET_ipq40xx||TARGET_ipq806x||TARGET_ipq807x||TARGET_mvebu||TARGET_rockchip||TARGET_armvirt) \\/g' package/lean/autocore/Makefile

# Modify default
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root:::0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i 's/R24.8.1/R24.8.1/g' package/lean/default-settings/files/zzz-default-settings
sed -i '34d' package/lean/default-settings/files/zzz-default-settings
sed -i '34d' package/lean/default-settings/files/zzz-default-settings
sed -i "s/DISTRIB_ID='%D'/DISTRIB_ID='OpenWrt'/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_RELEASE='%V'/DISTRIB_RELEASE=''/g" package/base-files/files/etc/openwrt_release
#sed -i "s/DISTRIB_REVISION='%R'/DISTRIB_REVISION='R24.6.1'/g" package/base-files/files/etc/openwrt_release
#sed -i "s/DISTRIB_DESCRIPTION='%D %V %C'/DISTRIB_DESCRIPTION='OpenWrt R24.6.1 '/g" package/base-files/files/etc/openwrt_release
sed -i 's/NAME="%D"/NAME="OpenWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION="%V"/VERSION=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/PRETTY_NAME="%D %V"/PRETTY_NAME="OpenWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION_ID="%v"/VERSION_ID=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/OPENWRT_RELEASE="%D %V %C"/OPENWRT_RELEASE="OpenWrt %C"/g' package/base-files/files/usr/lib/os-release
sed -i 's/%D %V/Base on OpenWrt by Lean/g' package/base-files/files/etc/banner

# 添加额外软件包
#git clone -b master --single-branch https://github.com/vernesong/OpenClash package/luci-app-openclash
#git clone https://github.com/ophub/luci-app-amlogic package/luci-app-amlogic
#git clone https://github.com/sherlsenlinmu/apps package/apps
git clone https://github.com/kiddin9/luci-app-dnsfilter package/luci-app-dnsfilter
git clone -b main --single-branch https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall-packages
git clone https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
#git clone https://github.com/jefferymvp/luci-app-koolproxyR package/luci-app-koolproxyR
#git clone https://github.com/rufengsuixing/luci-app-zerotier package/luci-app-zerotier
#git clone https://github.com/sirpdboy/luci-app-advancedplus package/luci-app-advancedplus
#git clone https://github.com/sirpdboy/luci-app-ddns-go package/luci-app-ddns-go
#git clone https://github.com/sirpdboy/luci-app-lucky package/luci-app-lucky
#git clone https://github.com/kiddin9/openwrt-packages package/openwrt-packages


# 晶晨宝盒
#sed -i "s|https.*/amlogic-s9xxx-openwrt|https://github.com/breakings/OpenWrt|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|http.*/library|https://github.com/breakings/OpenWrt/opt/kernel|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|s9xxx_lede|ARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|.img.gz|..OPENWRT_SUFFIX|g" package/luci-app-amlogic/root/etc/config/amlogic

# readd cpufreq for aarch64
#sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' feeds/luci/applications/luci-app-cpufreq/Makefile
#sed -i 's/services/system/g'  feeds/luci/applications/luci-app-cpufreq/luasrc/controller/cpufreq.lua
#sed -i 's/"CPU 性能优化调节"/"CPU 调频"/g'  feeds/luci/applications/luci-app-cpufreq/po/zh-cn/cpufreq.po

./scripts/feeds update -a
./scripts/feeds install -a
