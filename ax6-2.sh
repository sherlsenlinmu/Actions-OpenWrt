#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: ax6-2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 删除软件包
rm -rf package/lean/luci-app-zerotier
#rm -rf package/lean/luci-app-easymesh
rm -rf package/lean/luci-app-vlmcsd
rm -rf package/lean/vlmcsd
rm -rf package/lean/luci-app-aliyundrive-webdav
rm -rf package/lean/aliyundrive-webdav
rm -rf package/lean/luci-app-unblockmusic
rm -rf package/lean/UnblockNeteaseMusicGo
rm -rf package/lean/luci-app-pushbot
rm -rf package/lean/autocore
rm -rf feeds/packages/net/zerotier
rm -rf feeds/packages/net/smartdns

# Modify default
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root::0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i 's/R21.7.1.100/R23.6.1/g' package/lean/default-settings/files/zzz-default-settings
#sed -i 's#root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/lean/default-settings/files/zzz-default-settings
sed -i '33d' package/lean/default-settings/files/zzz-default-settings
sed -i "s/DISTRIB_ID='%D'/DISTRIB_ID='OpenWrt'/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_RELEASE='%V'/DISTRIB_RELEASE=''/g" package/base-files/files/etc/openwrt_release
sed -i 's/NAME="%D"/NAME="OpenWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION="%V"/VERSION=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/PRETTY_NAME="%D %V"/PRETTY_NAME="OpenWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION_ID="%v"/VERSION_ID=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/OPENWRT_RELEASE="%D %V %C"/OPENWRT_RELEASE="OpenWrt %C"/g' package/base-files/files/usr/lib/os-release
sed -i 's/%D %V/Base on OpenWrt by Lean/g' package/base-files/files/etc/banner

# 添加额外软件包
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/apps/luci-app-openclash
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-dnsfilter package/apps/luci-app-dnsfilter
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-smartdns package/apps/luci-app-smartdns
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-ipsec-server package/apps/luci-app-ipsec-server
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-vlmcsd package/lean/luci-app-vlmcsd
svn co https://github.com/kiddin9/openwrt-packages/trunk/vlmcsd package/lean/vlmcsd
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-aliyundrive-webdav package/lean/luci-app-aliyundrive-webdav
svn co https://github.com/kiddin9/openwrt-packages/trunk/aliyundrive-webdav package/lean/aliyundrive-webdav
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-unblockmusic package/lean/luci-app-unblockmusic
svn co https://github.com/kiddin9/openwrt-packages/trunk/UnblockNeteaseMusic-Go package/lean/UnblockNeteaseMusic-Go
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pushbot package/lean/luci-app-pushbot
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne package/apps/luci-theme-argonne
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-argonne-config package/apps/luci-app-argonne-config
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pppoe-server package/apps/luci-app-pppoe-server
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-ikoolproxy package/apps/luci-app-ikoolproxy
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-minieap package/apps/luci-app-minieap
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-iptvhelper package/apps/luci-app-iptvhelper
#svn co https://github.com/kiddin9/openwrt-packages/trunk/iptvhelper package/apps/iptvhelper
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/autocore package/lean/autocore
svn co https://github.com/coolsnowwolf/packages/trunk/net/zerotier feeds/packages/net/zerotier
svn co https://github.com/coolsnowwolf/packages/trunk/net/smartdns feeds/packages/net/smartdns
git clone -b packages --single-branch https://github.com/xiaorouji/openwrt-passwall package/apps/passwall
git clone -b luci --single-branch https://github.com/xiaorouji/openwrt-passwall package/apps/luci-app-passwall
git clone https://github.com/rufengsuixing/luci-app-zerotier package/lean/luci-app-zerotier
#git clone -b default --single-branch https://github.com/AutoCONFIG/minieap-openwrt.git package/apps/minieap-openwrt
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-timewol package/apps/luci-app-control-timewol
svn co https://github.com/sherlsenlinmu/apps/trunk/luci-app-control-weburl package/apps/luci-app-control-weburl
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-speedlimit package/apps/luci-app-control-speedlimit
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-msd_lite package/apps/luci-app-msd_lite
svn co https://github.com/kiddin9/openwrt-packages/trunk/msd_lite package/apps/msd_lite
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-autotimeset package/apps/luci-app-autotimeset
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pptp-server package/apps/luci-app-pptp-server

# luci-app-easymesh
#git clone https://github.com/ntlf9t/luci-app-easymesh package/lean/luci-app-easymesh
#sed -i 's/wpad-mesh-openssl/wpad-openssl/g' package/lean/luci-app-easymesh/Makefile

./scripts/feeds update -a
./scripts/feeds install -a
