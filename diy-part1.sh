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
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
sed -i '3d' feeds.conf.default
sed -i '1d' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git routing https://git.openwrt.org/feed/routing.git^4f235865e7d8c37b4ea7d8ee55b4e603a11e06b7' >>feeds.conf.default
echo 'src-git packages https://github.com/coolsnowwolf/packages.git^91eb26dd5f48ed042c0cd963e1ed226e1e47899e' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
