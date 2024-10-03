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

# luci-app-nekoclash
find ./ | grep Makefile | grep nekobox | xargs rm -f  
git clone https://github.com/Thaolga/openwrt-nekobox  package/openwrt-nekobox
# luci-app-daed-next
# git clone https://github.com/sbwml/luci-app-daed-next package/daed-next

# 修改 dae.init 加上日志记录
# [ -e package/feeds/packages/dae/files/dae.init ] && sed -i 's,run -c "$config_file",run -c "$config_file" --logfile /var/log/dae.log --logfile-maxbackups 1 --logfile-maxsize 1,g' package/feeds/packages/dae/files/dae.init
