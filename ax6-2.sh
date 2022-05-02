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
rm -rf package/lean/luci-app-easymesh
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
rm -rf feeds/packages/net/dawn

# Modify default
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root::0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i 's/R21.7.1.100/R22.5.2/g' package/lean/default-settings/files/zzz-default-settings
#sed -i 's#root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/lean/default-settings/files/zzz-default-settings
sed -i '33d' package/lean/default-settings/files/zzz-default-settings

# 添加额外软件包
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/apps/luci-app-openclash
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-dnsfilter package/apps/luci-app-dnsfilter
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-adguardhome package/apps/luci-app-adguardhome
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-smartdns package/apps/luci-app-smartdns
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-iptvhelper package/apps/luci-app-iptvhelper
svn co https://github.com/kiddin9/openwrt-packages/trunk/iptvhelper package/apps/iptvhelper
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-socat package/apps/luci-app-socat
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-vlmcsd package/lean/luci-app-vlmcsd
svn co https://github.com/kiddin9/openwrt-packages/trunk/vlmcsd package/lean/vlmcsd
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-aliyundrive-webdav package/lean/luci-app-aliyundrive-webdav
svn co https://github.com/kiddin9/openwrt-packages/trunk/aliyundrive-webdav package/lean/aliyundrive-webdav
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-unblockmusic package/lean/luci-app-unblockmusic
svn co https://github.com/kiddin9/openwrt-packages/trunk/UnblockNeteaseMusic-Go package/lean/UnblockNeteaseMusic-Go
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pushbot package/lean/luci-app-pushbot
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-koolproxyR package/apps/luci-app-koolproxyR
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/autocore package/lean/autocore
svn co https://github.com/coolsnowwolf/packages/trunk/net/zerotier feeds/packages/net/zerotier
svn co https://github.com/coolsnowwolf/packages/trunk/net/smartdns feeds/packages/net/smartdns
svn co https://github.com/coolsnowwolf/packages/trunk/net/dawn feeds/packages/net/dawn
git clone -b packages --single-branch https://github.com/xiaorouji/openwrt-passwall package/apps/passwall
git clone -b luci --single-branch https://github.com/xiaorouji/openwrt-passwall package/apps/luci-app-passwall
git clone https://github.com/rufengsuixing/luci-app-zerotier package/lean/luci-app-zerotier

# luci-app-easymesh
git clone https://github.com/ntlf9t/luci-app-easymesh package/lean/luci-app-easymesh
sed -i 's/wpad-mesh-openssl/wpad-openssl/g' package/lean/luci-app-easymesh/Makefile

./scripts/feeds update -a
./scripts/feeds install -a
