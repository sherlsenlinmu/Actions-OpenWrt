#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i '3d' feeds.conf.default
#sed -i '2d' feeds.conf.default
#sed -i 's/#src-git luci/src-git luci/g' feeds.conf.default
#sed -i 's#root::0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' feeds.conf.default

# Add a feed source
#echo 'src-git luci https://github.com/coolsnowwolf/luci' >>feeds.conf.default
#echo 'src-git routing https://git.openwrt.org/feed/routing.git^fffa9cb161acee226f1080cda2a3d53ded656f14' >>feeds.conf.default
#echo 'src-git packages https://github.com/coolsnowwolf/packages.git^fd95b1a5f9c1130339c4e61bc6061ae55e04220d' >>feeds.conf.default
