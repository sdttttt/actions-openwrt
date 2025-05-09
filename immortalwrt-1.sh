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

wget https://github.com/zfl9/chinadns-ng/raw/refs/heads/master/res/chnroute.nftset -o $GITHUB_WORKSPACE/files/root/chnroute.nftset
wget https://github.com/zfl9/chinadns-ng/raw/refs/heads/master/res/chnlist.txt -o $GITHUB_WORKSPACE/files/root/chnlist.txt

sed -i 's/Os/O2 -march=x86-64-v2/g' include/target.mk

# 使用动态抢占
cat >> target/linux/x86/config-6.6 <<-EOF
CONFIG_PREEMPT_DYNAMIC=y
EOF
cat >> target/linux/x86/64/config-6.6 <<-EOF
CONFIG_PREEMPT_DYNAMIC=y
EOF

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

echo "克隆 YAOF"
git clone -b 24.10 --depth 1 https://github.com/QiuSimons/YAOF /workdir/.YAOF

# echo "打打补丁~"
### 必要的 Patches FROM YAOF ###
# TCP optimizations
cp -rf /workdir/.YAOF/PATCH/kernel/6.7_Boost_For_Single_TCP_Flow/* ./target/linux/generic/backport-6.6/
cp -rf /workdir/.YAOF/PATCH/kernel/6.8_Boost_TCP_Performance_For_Many_Concurrent_Connections-bp_but_put_in_hack/* ./target/linux/generic/hack-6.6/
cp -rf /workdir/.YAOF/PATCH/kernel/6.8_Better_data_locality_in_networking_fast_paths-bp_but_put_in_hack/* ./target/linux/generic/hack-6.6/
# UDP
cp -rf /workdir/.YAOF/PATCH/kernel/6.7_FQ_packet_scheduling/* ./target/linux/generic/backport-6.6/
# BBRv3
cp -rf /workdir/.YAOF/PATCH/kernel/bbr3/* ./target/linux/generic/hack-6.6/
# fullcore
cp -rf /workdir/.YAOF/PATCH/kernel/bcmfullcone/* ./target/linux/generic/hack-6.6/

# LRNG
# cp -rf ../PATCH/LRNG/* ./target/linux/generic/hack-5.15/
