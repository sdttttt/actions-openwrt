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
sed -i 's/Os/O3 -march=x86-64-v2/g' include/target.mk
# 交换 LAN/WAN 口
sed -i 's,"eth1" "eth0","eth0" "eth1",g' target/linux/rockchip/armv8/base-files/etc/board.d/02_network
sed -i "s,'eth1' 'eth0','eth0' 'eth1',g" target/linux/rockchip/armv8/base-files/etc/board.d/02_network

# 修改主机名ImmortalWrt -> OpenWrt
sed -i "s,hostname='ImmortalWrt',hostname='OpenWrt',g" package/base-files/files/bin/config_generate
# 修改默认IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=6.1/g' target/linux/x86/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.1/g' target/linux/x86/Makefile

# 添加DAE所需要的geodata
#if [ -e /workdir/files ]
#then
#  mkdir /workdir/files/usr/share/dae
#  curl -o /workdir/files/usr/share/dae/geoip.dat https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat
#  curl -o /workdir/files/usr/share/dae/geosite.dat https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat
#fi

# echo "克隆 YAOF"
# git clone -b 23.05 --depth 1 https://github.com/QiuSimons/YAOF /workdir/.YAOF

# echo "打打补丁~"
### 必要的 Patches FROM YAOF ###
# TCP optimizations
# cp -rf /workdir/.YAOF/PATCH/backport/TCP/* ./target/linux/generic/backport-5.15/
# x86_csum
# cp -rf /workdir/.YAOF/PATCH/backport/x86_csum/* ./target/linux/generic/backport-5.15/
# BBRv3
# cp -rf /workdir/.YAOF/PATCH/BBRv3/kernel/* ./target/linux/generic/backport-5.15/
# LRNG
# cp -rf ../PATCH/LRNG/* ./target/linux/generic/hack-5.15/
