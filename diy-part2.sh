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
# 5.4内核
#sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' target/linux/armvirt/Makefile

# 删除软件包
rm -rf feeds/luci/applications/luci-app-zerotier
rm -rf feeds/luci/applications/luci-app-socat
rm -rf feeds/packages/net/v2ray-geodata
#rm -rf package/lean/autosamba

# autocore
sed -i 's/DEPENDS:=@(.*/DEPENDS:=@(TARGET_bcm27xx||TARGET_bcm53xx||TARGET_ipq40xx||TARGET_ipq806x||TARGET_ipq807x||TARGET_mvebu||TARGET_rockchip||TARGET_armvirt) \\/g' package/lean/autocore/Makefile

# Modify default
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root:::0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i 's/R23.2.14/R23.2.17/g' package/lean/default-settings/files/zzz-default-settings
sed -i '34d' package/lean/default-settings/files/zzz-default-settings
sed -i '34d' package/lean/default-settings/files/zzz-default-settings
sed -i "s/DISTRIB_ID='%D'/DISTRIB_ID='OpenWrt'/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_RELEASE='%V'/DISTRIB_RELEASE=''/g" package/base-files/files/etc/openwrt_release
sed -i 's/NAME="%D"/NAME="OpenWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION="%V"/VERSION=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/PRETTY_NAME="%D %V"/PRETTY_NAME="OpenWrt"/g' package/base-files/files/usr/lib/os-release
sed -i 's/VERSION_ID="%v"/VERSION_ID=""/g' package/base-files/files/usr/lib/os-release
sed -i 's/OPENWRT_RELEASE="%D %V %C"/OPENWRT_RELEASE="OpenWrt %C"/g' package/base-files/files/usr/lib/os-release
sed -i 's/%D %V/Base on OpenWrt by lean/g' package/base-files/files/etc/banner

# 添加额外软件包
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/apps/luci-app-openclash
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/apps/luci-app-amlogic
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/apps/luci-app-filebrowser
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-smartdns package/apps/luci-app-smartdns
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-advanced package/apps/luci-app-advanced
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-timewol package/apps/luci-app-control-timewol
svn co https://github.com/sherlsenlinmu/apps/trunk/luci-app-control-weburl package/apps/luci-app-control-weburl
svn co https://github.com/sherlsenlinmu/apps/trunk/luci-app-rebootschedule package/apps/luci-app-rebootschedule
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-socat package/apps/luci-app-socat
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-speedlimit package/apps/luci-app-control-speedlimit
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-adguardhome package/apps/luci-app-adguardhome
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-iptvhelper package/apps/luci-app-iptvhelper
#svn co https://github.com/kiddin9/openwrt-packages/trunk/iptvhelper package/apps/iptvhelper
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-dnsfilter package/apps/luci-app-dnsfilter
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-usb3disable package/apps/luci-app-usb3disable
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-gost package/apps/luci-app-gost
svn co https://github.com/kiddin9/openwrt-packages/trunk/gost package/apps/gost
svn co https://github.com/sherlsenlinmu/apps/trunk/luci-app-eqos package/apps/luci-app-eqos
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-minieap package/apps/luci-app-minieap
svn co https://github.com/kiddin9/openwrt-packages/trunk/minieap-openwrt package/apps/minieap-openwrt
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-mosdns package/apps/luci-app-mosdns
svn co https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns package/apps/luci-app-mosdns 
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pppoe-server package/apps/luci-app-pppoe-server
svn co https://github.com/kenzok8/small-package/trunk/luci-app-ikoolproxy package/apps/luci-app-ikoolproxy
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne package/apps/luci-theme-argonne
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-argonne-config package/apps/luci-app-argonne-config
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-argon-config package/apps/luci-app-argon-config
svn co https://github.com/kenzok8/small-package/trunk/luci-app-nginx-manager package/apps/luci-app-nginx-manager
git clone -b packages --single-branch https://github.com/xiaorouji/openwrt-passwall package/apps/passwall
git clone -b luci --single-branch https://github.com/xiaorouji/openwrt-passwall package/apps/luci-app-passwall
git clone https://github.com/rufengsuixing/luci-app-zerotier package/apps/luci-app-zerotier
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-bypass package/apps/openwrt-bypass
svn co https://github.com/kiddin9/openwrt-packages/trunk/lua-maxminddb  package/apps/lua-maxminddb
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-wxedge package/apps/luci-app-wxedge
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-lib-iform package/apps/luci-lib-iform
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-lib-taskd package/apps/luci-lib-taskd
svn co https://github.com/kiddin9/openwrt-packages/trunk/taskd package/apps/taskd
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-lib-xterm package/apps/luci-lib-xterm
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-speedtest-web package/apps/luci-app-speedtest-web
#svn co https://github.com/kiddin9/openwrt-packages/trunk/speedtest-web package/apps/speedtest-web
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netspeedtest package/apps/netspeedtest 
git clone https://github.com/sirpdboy/luci-app-lucky package/apps/luci-app-lucky
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-ddns-go package/apps/luci-app-ddns-go
#svn co https://github.com/sherlsenlinmu/lede/trunk/package/lean/autosamba package/lean/autosamba
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-msd_lite package/apps/luci-app-msd_lite
svn co https://github.com/kiddin9/openwrt-packages/trunk/msd_lite package/apps/msd_lite
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-autotimeset package/apps/luci-app-autotimeset
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-alist package/apps/luci-app-alist
#svn co https://github.com/kiddin9/openwrt-packages/trunk/alist package/apps/alist

# 晶晨宝盒
sed -i "s|https.*/amlogic-s9xxx-openwrt|https://github.com/breakings/OpenWrt|g" package/apps/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|http.*/library|https://github.com/breakings/OpenWrt/opt/kernel|g" package/apps/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|s9xxx_lede|ARMv8|g" package/apps/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|.img.gz|..OPENWRT_SUFFIX|g" package/apps/luci-app-amlogic/root/etc/config/amlogic

# readd cpufreq for aarch64
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' feeds/luci/applications/luci-app-cpufreq/Makefile
sed -i 's/services/system/g'  feeds/luci/applications/luci-app-cpufreq/luasrc/controller/cpufreq.lua
sed -i 's/"CPU 性能优化调节"/"CPU 调频"/g'  feeds/luci/applications/luci-app-cpufreq/po/zh-cn/cpufreq.po

./scripts/feeds update -a
./scripts/feeds install -a
