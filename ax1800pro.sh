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
rm -rf feeds/luci/themes/luci-theme-bootstrap

# Modify default
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
#sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root:::0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i "s/DISTRIB_ID='%D'/DISTRIB_ID='OpenWrt'/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_RELEASE='%V'/DISTRIB_RELEASE=''/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='%R'/DISTRIB_REVISION='R25.1.18'/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_DESCRIPTION='%D %V %C'/DISTRIB_DESCRIPTION='OpenWrt 25.1.18 '/g" package/base-files/files/etc/openwrt_release
sed -i 's/NAME="%D"/NAME="OpenWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION="%V"/VERSION=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/PRETTY_NAME="%D %V"/PRETTY_NAME="OpenWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION_ID="%v"/VERSION_ID=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/OPENWRT_RELEASE="%D %V %C"/OPENWRT_RELEASE="OpenWrt %C"/g' package/base-files/files/usr/lib/os-release
sed -i 's/%D %V/Base on OpenWrt by LiBwrt/g' package/base-files/files/etc/banner

# 添加额外软件包
#git clone https://github.com/sherlsenlinmu/apps package/apps
git clone https://github.com/kiddin9/luci-app-dnsfilter package/luci-app-dnsfilter
#git clone -b main --single-branch https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
#git clone https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall-packages
#git clone https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
#git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset

./scripts/feeds update -a
./scripts/feeds install -a
