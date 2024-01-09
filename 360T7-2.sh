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
rm -rf feeds/luci/applications/luci-app-unblockmusic
rm -rf feeds/packages/multimedia/UnblockNeteaseMusic-Go
#rm -rf feeds/packages/net/xray-core
#rm -rf feeds/packages/net/chinadns-ng
#rm -rf feeds/packages/net/v2ray-plugin
#sed -i '1d' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-h3c-nx30pro.dts

# Modify default
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.6.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root::0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i "s/DISTRIB_ID='%D'/DISTRIB_ID='ImmortalWrt'/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_RELEASE='%V'/DISTRIB_RELEASE=''/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='%R'/DISTRIB_REVISION='R24.1.9'/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_DESCRIPTION='%D %V %C'/DISTRIB_DESCRIPTION='ImmortalWrt R24.1.9 '/g" package/base-files/files/etc/openwrt_release
sed -i 's/NAME="%D"/NAME="ImmortalWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION="%V"/VERSION=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/PRETTY_NAME="%D %V"/PRETTY_NAME="ImmortalWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION_ID="%v"/VERSION_ID=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/OPENWRT_RELEASE="%D %V %C"/OPENWRT_RELEASE="ImmortalWrt %C"/g' package/base-files/files/usr/lib/os-release
sed -i 's/%D %V/Base on ImmortalWrt by Hanwckf/g' package/base-files/files/etc/banner

# 添加额外软件包
git clone https://github.com/sherlsenlinmu/apps package/apps
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-timewol package/apps/luci-app-control-timewol
#svn co https://github.com/kiddin9/openwrt-packages/trunk/wol package/apps/wol
#svn co https://github.com/sherlsenlinmu/apps/trunk/luci-app-control-weburl package/apps/luci-app-control-weburl
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-speedlimit package/apps/luci-app-control-speedlimit
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-smartdns package/apps/luci-app-smartdns
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-autotimeset package/apps/luci-app-autotimeset
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-dnsfilter package/apps/luci-app-dnsfilter
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pppoe-server package/apps/luci-app-pppoe-server
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pptp-server package/apps/luci-app-pptp-server
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pushbot package/apps/luci-app-pushbot
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-ipsec-server package/apps/luci-app-ipsec-server
#git clone https://github.com/rufengsuixing/luci-app-zerotier package/apps/luci-app-zerotier
#git clone -b packages --single-branch https://github.com/xiaorouji/openwrt-passwall package/apps/passwall
#git clone -b luci --single-branch https://github.com/xiaorouji/openwrt-passwall package/apps/luci-app-passwall
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-msd_lite package/apps/luci-app-msd_lite
#svn co https://github.com/kiddin9/openwrt-packages/trunk/msd_lite package/apps/msd_lite
#svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/apps/luci-app-passwall
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-core package/apps/xray-core
#svn co https://github.com/kiddin9/openwrt-packages/trunk/v2ray-plugin package/apps/v2ray-plugin
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/apps/chinadns-ng
#svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/apps/luci-app-openclash
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-unblockmusic package/apps/luci-app-unblockmusic
#svn co https://github.com/kiddin9/openwrt-packages/trunk/UnblockNeteaseMusic-Go package/apps/UnblockNeteaseMusic-Go
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-aliyundrive-webdav package/apps/luci-app-aliyundrive-webdav
#svn co https://github.com/kiddin9/openwrt-packages/trunk/aliyundrive-webdav package/apps/aliyundrive-webdav

./scripts/feeds update -a
./scripts/feeds install -a
