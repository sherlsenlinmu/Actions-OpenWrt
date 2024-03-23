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

# Modify default
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root:::0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i 's/R24.2.2/R24.3.23/g' package/lean/default-settings/files/zzz-default-settings
sed -i '34d' package/lean/default-settings/files/zzz-default-settings
sed -i '34d' package/lean/default-settings/files/zzz-default-settings
sed -i "s/DISTRIB_ID='%D'/DISTRIB_ID='OpenWrt'/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_RELEASE='%V'/DISTRIB_RELEASE=''/g" package/base-files/files/etc/openwrt_release
sed -i 's/NAME="%D"/NAME="OpenWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION="%V"/VERSION=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/PRETTY_NAME="%D %V"/PRETTY_NAME="OpenWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION_ID="%v"/VERSION_ID=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/OPENWRT_RELEASE="%D %V %C"/OPENWRT_RELEASE="OpenWrt %C"/g' package/base-files/files/usr/lib/os-release
sed -i 's/%D %V/Base on OpenWrt by Lean/g' package/base-files/files/etc/banner

# 添加额外软件包
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-timewol package/apps/luci-app-control-timewol
#svn co https://github.com/sherlsenlinmu/apps/trunk/luci-app-control-weburl package/apps/luci-app-control-weburl
#svn co https://github.com/sherlsenlinmu/apps/trunk/luci-app-rebootschedule package/apps/luci-app-rebootschedule
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-speedlimit package/apps/luci-app-control-speedlimit
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-dnsfilter package/apps/luci-app-dnsfilter
git clone -b main --single-branch https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall-packages
git clone https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
#git clone https://github.com/rufengsuixing/luci-app-zerotier package/apps/luci-app-zerotier


./scripts/feeds update -a
./scripts/feeds install -a
