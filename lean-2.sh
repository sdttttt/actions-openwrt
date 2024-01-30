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

set +e

# luci-app-mosdns
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns --depth=1  -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata --depth=1  package/v2ray-geodata

# luci-app-openclash
find ./ | grep Makefile | grep openclash | xargs rm -f  
git clone https://github.com/vernesong/OpenClash --depth=1  package/luci-app-openclash 
