#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i '4d' feeds.conf.default
sed -i '3d' feeds.conf.default
sed -i '2d' feeds.conf.default
sed -i '1d' feeds.conf.default

# Add a feed source 115
#echo 'src-git helloworld https://github.com/fw876/helloworld^9d45ae8555c6f4cc4cb4b7177e0217b1ca0afa87' >>feeds.conf.default
#echo 'src-git packages https://github.com/coolsnowwolf/packages^e82d7306bae3ee9d4d0b29ac95525174ceff6136' >>feeds.conf.default
#echo 'src-git luci https://github.com/coolsnowwolf/luci^974fb045f86ac0f3667eff6a6b973434db707dba' >>feeds.conf.default
#echo 'src-git routing https://git.openwrt.org/feed/routing.git^0f1d89c2e95a428835e269b0c0e832e8675c73e8' >>feeds.conf.default
#echo 'src-git telephony https://git.openwrt.org/feed/telephony.git^1e2c2bcb5faf33408ea566ee7bae55e58984d80c' >>feeds.conf.default

# Add a feed source 155
#echo 'src-git helloworld https://github.com/fw876/helloworld^b4ede27bc2665208b7c5b2901abab55ea780d7b3' >>feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git packages https://github.com/coolsnowwolf/packages^da33e86cc79bf69859ea6897f6acf4dbe329c200' >>feeds.conf.default
echo 'src-git luci https://github.com/coolsnowwolf/luci^9b796b1d6048987a5ac46acb658b0d89edc59c8d' >>feeds.conf.default
echo 'src-git routing https://git.openwrt.org/feed/routing.git^2ac3accf36db53906ccb081dcbe6fafd05beaa6d' >>feeds.conf.default
echo 'src-git telephony https://git.openwrt.org/feed/telephony.git^5ced7ea4fc9bd746273d564bf3c102f253d2182e' >>feeds.conf.default
