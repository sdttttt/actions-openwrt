# 本机编译脚本
#!/bin/bash
set +e

openwrt_repo_url=${REPO_URL="https://github.com/immortalwrt/immortalwrt"}
openwrt_repo_branch=${REPO_BRANCH="openwrt-25.12"}
feeds_conf=${$FEEDS_CONF="feeds.conf.default"}
config_file=${CONFIG_FILE="immortalwrt.25.x86.config"}

git clone --single-branch --filter=blob:none -b $openwrt_repo_branch $openwrt_repo_url  openwrt

 [ -e $feeds_conf ] && mv $feeds_conf openwrt/feeds.conf.default

pushd ./openwrt

# 交换 LAN/WAN 口 for Friendly R2S
sed -i 's,"eth1" "eth0","eth0" "eth1",g' target/linux/rockchip/armv8/base-files/etc/board.d/02_network
sed -i "s,'eth1' 'eth0','eth0' 'eth1',g" target/linux/rockchip/armv8/base-files/etc/board.d/02_network

# 修改主机名ImmortalWrt -> OpenWrt
sed -i "s,hostname='ImmortalWrt',hostname='OpenWrt',g" package/base-files/files/bin/config_generate

# 修改默认IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

./scripts/feeds update -a
./scripts/feeds install -a

popd

[ -e $config_file ] && mv $config_file openwrt/.config

pushd ./openwrt

make defconfig
make -j4 || make -j1 V=s
