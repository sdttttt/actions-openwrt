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

# 交换 LAN/WAN 口
sed -i 's,"eth1" "eth0","eth0" "eth1",g' target/linux/rockchip/armv8/base-files/etc/board.d/02_network
sed -i "s,'eth1' 'eth0','eth0' 'eth1',g" target/linux/rockchip/armv8/base-files/etc/board.d/02_network

# 修改内核版本
sed -i "s,.203,.272,g" include/kernel-5.4
sed -i "s,.203,.272,g" include/kernel-5.4
sed -i "s,fc933f5b13066cfa54aacb5e86747a167bad1d8d23972e4a03ab5ee36c29798a,3599d5959a403e64be407d7f05e56cb270d6ddd154e89a596609919ab1e2e366,g" include/kernel-5.4

# 修改主机名ImmortalWrt -> OpenWrt
sed -i "s,hostname='ImmortalWrt',hostname='OpenWrt',g" package/base-files/files/bin/config_generate
# 修改默认IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 添加DAE所需要的geodata
if [ -e /workdir/files ]
then
  mkdir /workdir/files/usr/share/dae
  curl -o /workdir/files/usr/share/dae/geoip.dat https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat
  curl -o /workdir/files/usr/share/dae/geosite.dat https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat
fi
