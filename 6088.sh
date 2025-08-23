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
#rm -rf feeds/luci/applications/luci-app-passwall
#rm -rf feeds/luci/applications/luci-app-openclash
#rm -rf feeds/luci/applications/luci-app-unblockmusic
#rm -rf feeds/packages/multimedia/UnblockNeteaseMusic-Go
#rm -rf feeds/packages/net/xray-core
#rm -rf feeds/packages/net/chinadns-ng
#rm -rf feeds/packages/net/v2ray-plugin
#rm -rf feeds/luci/themes/luci-theme-bootstrap

# Modify default
sed -i 's/192.168.6.1/192.168.10.1/g' package/base-files/files/bin/config_generate
#sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root:::0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i "s/DISTRIB_ID='%D'/DISTRIB_ID='ImmortalWrt'/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_RELEASE='%V'/DISTRIB_RELEASE=''/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='%R'/DISTRIB_REVISION='R25.8.23'/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_DESCRIPTION='%D %V %C'/DISTRIB_DESCRIPTION='ImmortalWrt R25.8.23 '/g" package/base-files/files/etc/openwrt_release
sed -i 's/NAME="%D"/NAME="ImmortalWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION="%V"/VERSION=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/PRETTY_NAME="%D %V"/PRETTY_NAME="ImmortalWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION_ID="%v"/VERSION_ID=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/OPENWRT_RELEASE="%D %V %C"/OPENWRT_RELEASE="ImmortalWrt %C"/g' package/base-files/files/usr/lib/os-release
sed -i 's/%D %V/Base on ImmortalWrt/g' package/base-files/files/etc/banner

# 添加额外软件包
git clone https://github.com/kiddin9/luci-app-dnsfilter package/luci-app-dnsfilter
#git clone https://github.com/sherlsenlinmu/luci-app-unblockmusic package/luci-app-unblockmusic

./scripts/feeds update -a
./scripts/feeds install -a
