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
rm -rf package/lean/luci-app-zerotier
rm -rf package/lean/mentohust
rm -rf package/lean/luci-app-netdata
rm -rf package/lean/luci-app-easymesh
rm -rf package/lean/luci-app-vlmcsd
rm -rf package/lean/vlmcsd
rm -rf package/lean/luci-app-aliyundrive-webdav
rm -rf package/lean/aliyundrive-webdav
rm -rf package/lean/luci-app-unblockmusic
rm -rf package/lean/UnblockNeteaseMusic-Go
rm -rf package/lean/luci-app-jd-dailybonus
rm -rf package/lean/luci-app-pushbot

# Modify default
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root::0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i 's/R22.1.1/R22.1.15/g' package/lean/default-settings/files/zzz-default-settings
#sed -i 's#root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/lean/default-settings/files/zzz-default-settings
sed -i '34d' package/lean/default-settings/files/zzz-default-settings

# 添加额外软件包
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/apps/luci-app-openclash
git clone https://github.com/rufengsuixing/luci-app-zerotier package/lean/luci-app-zerotier
git clone https://github.com/small-5/luci-app-adblock-plus package/apps/luci-app-adblock-plus
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/apps/luci-app-filebrowser
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-adguardhome package/apps/luci-app-adguardhome
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-smartdns package/apps/luci-app-smartdns
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-advanced package/apps/luci-app-advanced
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-timewol package/apps/luci-app-control-timewol
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-eqos package/apps/luci-app-eqos
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-iptvhelper package/apps/luci-app-iptvhelper
svn co https://github.com/kiddin9/openwrt-packages/trunk/iptvhelper package/apps/iptvhelper
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-mentohust package/apps/luci-app-mentohust
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/mentohust package/lean/mentohust
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-rebootschedule package/apps/luci-app-rebootschedule
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-socat package/apps/luci-app-socat
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-timecontrol package/apps/luci-app-timecontrol
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata package/lean/luci-app-netdata
git clone https://github.com/ntlf9t/luci-app-easymesh package/lean/luci-app-easymesh
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ package/lean/
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ package/lean/
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ package/lean/
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ package/lean/
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ package/lean/
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ package/lean/
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ package/lean/
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ package/lean/


# luci-app-easymesh
sed -i 's/wpad-mesh-openssl/wpad-openssl/g' package/lean/luci-app-easymesh/Makefile

./scripts/feeds update -a
./scripts/feeds install -a
