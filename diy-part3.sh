#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part3.sh
# Description: OpenWrt DIY script part 3 (After Update feeds)
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
rm -rf package/lean/UnblockNeteaseMusicGo
rm -rf package/lean/luci-app-jd-dailybonus
rm -rf package/lean/luci-app-pushbot
#rm -rf package/lean/trojan
#rm -rf package/lean/simple-obfs
rm -rf package/lean/vsftpd-alt
rm -rf package/lean/tcpping
rm -rf package/lean/microsocks
rm -rf package/lean/dns2socks
rm -rf package/lean/ipt2socks
rm -rf package/lean/luci-app-webadmin
rm -rf package/lean/luci-app-ttyd
rm -rf package/lean/luci-app-syncdial
rm -rf package/lean/luci-app-pptp-server
rm -rf package/lean/luci-app-pppoe-relay
rm -rf package/lean/luci-app-mwan3helper
rm -rf package/lean/luci-app-filetransfer
rm -rf package/lean/ipv6-helper
rm -rf package/lean/ddns-scripts_dnspod
rm -rf package/lean/autocore
rm -rf package/lean/luci-app-uugamebooster
rm -rf package/lean/uugamebooster
#rm -rf package/lean/luci-app-kodexplorer
#rm -rf package/network/utils/dpdk
rm -rf feeds/packages/net/adguardhome
rm -rf feeds/packages/net/zerotier
rm -rf feeds/packages/net/dawn
rm -rf feeds/packages/admin/netdata

# Modify default
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root::0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i 's/R21.7.1.100/R22.1.20/g' package/lean/default-settings/files/zzz-default-settings
#sed -i 's#root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/lean/default-settings/files/zzz-default-settings
sed -i '33d' package/lean/default-settings/files/zzz-default-settings

# 添加额外软件包
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/apps/luci-app-openclash
git clone https://github.com/rufengsuixing/luci-app-zerotier package/lean/luci-app-zerotier
git clone https://github.com/small-5/luci-app-adblock-plus package/apps/luci-app-adblock-plus
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-adguardhome package/apps/luci-app-adguardhome
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-smartdns package/apps/luci-app-smartdns
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
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-vlmcsd package/lean/luci-app-vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vlmcsd package/lean/vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-aliyundrive-webdav package/lean/luci-app-aliyundrive-webdav
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/aliyundrive-webdav package/lean/aliyundrive-webdav
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-unblockmusic package/lean/luci-app-unblockmusic
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/UnblockNeteaseMusic-Go package/lean/UnblockNeteaseMusic-Go
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-jd-dailybonus package/lean/luci-app-jd-dailybonus
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-pushbot package/lean/luci-app-pushbot
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vsftpd-alt package/lean/vsftpd-alt
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/tcpping package/lean/tcpping
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks package/lean/microsocks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/dns2socks package/lean/dns2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipt2socks package/lean/ipt2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-webadmin package/lean/luci-app-webadmin
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ttyd package/lean/luci-app-ttyd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-syncdial package/lean/luci-app-syncdial
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-pptp-server package/lean/luci-app-pptp-server
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-pppoe-relay package/lean/luci-app-pppoe-relay
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-mwan3helper package/lean/luci-app-mwan3helper
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-filetransfer package/lean/luci-app-filetransfer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipv6-helper package/lean/ipv6-helper
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_dnspod package/lean/ddns-scripts_dnspod
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/autocore package/lean/autocore
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-uugamebooster package/lean/luci-app-uugamebooster
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/uugamebooster package/lean/uugamebooster
#svn export https://github.com/openwrt/openwrt/trunk/include/meson.mk include/meson.mk
#svn co https://github.com/coolsnowwolf/lede/trunk/package/network/utils/dpdk package/network/utils/dpdk
svn co https://github.com/coolsnowwolf/packages/trunk/net/adguardhome feeds/packages/net/adguardhome
svn co https://github.com/coolsnowwolf/packages/trunk/net/zerotier feeds/packages/net/zerotier
svn co https://github.com/coolsnowwolf/packages/trunk/net/dawn feeds/packages/net/dawn
svn co https://github.com/coolsnowwolf/packages/trunk/admin/netdata feeds/packages/admin/netdata
git clone https://github.com/xiaorouji/openwrt-passwall package/apps/passwall

# luci-app-easymesh
sed -i 's/wpad-mesh-openssl/wpad-openssl/g' package/lean/luci-app-easymesh/Makefile

#./scripts/feeds update -a
./scripts/feeds install -a
