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
sed -i '4d' feeds.conf.default
sed -i '3d' feeds.conf.default
sed -i '2d' feeds.conf.default
sed -i '1d' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git routing https://git.openwrt.org/feed/routing.git^fffa9cb161acee226f1080cda2a3d53ded656f14' >>feeds.conf.default
echo 'src-git packages https://github.com/coolsnowwolf/packages.git^fd95b1a5f9c1130339c4e61bc6061ae55e04220d' >>feeds.conf.default
echo 'src-git luci https://github.com/coolsnowwolf/luci^5f363d93c5f6ec011ac3d63b6e15be23e27ecdb7' >>feeds.conf.default
echo 'src-git telephony https://git.openwrt.org/feed/telephony.git^561131d523d387df4c61e3e9851ea777b5a03408' >>feeds.conf.default
