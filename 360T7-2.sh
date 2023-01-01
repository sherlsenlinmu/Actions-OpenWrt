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
rm -rf feeds/luci/applications/luci-app-zerotier
rm -rf feeds/luci/applications/luci-app-socat

# Modify default
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root::0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow

# 添加额外软件包
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-timewol package/apps/luci-app-control-timewol
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-weburl package/apps/luci-app-control-weburl
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-rebootschedule package/apps/luci-app-rebootschedule
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-socat package/apps/luci-app-socat
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-dnsfilter package/apps/luci-app-dnsfilter
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-eqos package/apps/luci-app-eqos
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pppoe-server package/apps/luci-app-pppoe-server
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pptp-server package/apps/luci-app-pptp-server
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pushbot package/apps/luci-app-pushbot
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-turboacc package/apps/luci-app-turboacc
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-guest-wifi package/apps/luci-app-guest-wifi
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-ipsec-server package/apps/luci-app-ipsec-server
git clone https://github.com/rufengsuixing/luci-app-zerotier package/apps/luci-app-zerotier

./scripts/feeds update -a
./scripts/feeds install -a
