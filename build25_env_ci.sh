#!/bin/bash
set +e

openwrt_repo_url=${REPO_URL="https://github.com/immortalwrt/immortalwrt"}
openwrt_repo_branch=${REPO_BRANCH="openwrt-25.12"}
feeds_conf=${$FEEDS_CONF="feeds.conf.default"}
config_file=${CONFIG_FILE="immortalwrt.25.x86.config"}

git clone --single-branch --filter=blob:none -b $openwrt_repo_branch $openwrt_repo_url  openwrt

 [ -e $feeds_conf ] && mv $feeds_conf openwrt/feeds.conf.default

pushd ./openwrt

# 6.6内核使用 TEO CPU 空闲调度器, 开启BPF
KERNEL_VERSION="6.6"
CONFIG_CONTENT='
CONFIG_CPU_IDLE_GOV_MENU=n
CONFIG_CPU_IDLE_GOV_TEO=y
CONFIG_PREEMPT_DYNAMIC=y
CONFIG_BPF=y
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_ACT=y
'

# 查找所有与内核 6.6 相关的配置文件并将这些配置项追加到文件末尾
find ./target/linux/ -name "config-${KERNEL_VERSION}" | xargs -I{} sh -c "echo '$CONFIG_CONTENT' | tee -a {} > /dev/null"

# 交换 LAN/WAN 口 for Friendly R2S
sed -i 's,"eth1" "eth0","eth0" "eth1",g' target/linux/rockchip/armv8/base-files/etc/board.d/02_network
sed -i "s,'eth1' 'eth0','eth0' 'eth1',g" target/linux/rockchip/armv8/base-files/etc/board.d/02_network

# 修改主机名ImmortalWrt -> OpenWrt
sed -i "s,hostname='ImmortalWrt',hostname='OpenWrt',g" package/base-files/files/bin/config_generate

# 修改默认IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# luci-app-nikki
echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> feeds.conf.default

./scripts/feeds update -a
./scripts/feeds install -a

# 使用最新的
find ./package/feeds/ | grep "openclash" | xargs -I{} rm -f {}
git clone -b dev https://github.com/vernesong/OpenClash --depth=1  package/new/luci-app-openclash

find ./package/feeds/ | grep "mosdns" | xargs -I{} rm -f {}
git clone https://github.com/sbwml/luci-app-mosdns --depth=1  -b v5 package/new/mosdns

# 关闭Rust的CI编译检查
sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' feeds/packages/lang/rust/Makefile

popd

[ -e $config_file ] && mv $config_file openwrt/.config
