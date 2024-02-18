[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/P3TERX/Actions-OpenWrt/blob/master/LICENSE)

NanoPI-R2S Immortalwrt 固件，有23.05分支和主线分支.

- 配置基于官方预设
- GCC13编译
- 使用GLIBC代替musl
- O3优化
- lan/wan口交换

该固件自带的应用只有DAE(无luci和web)，netdata, mosdns和内存释放，dae有自带的配置文件，为黑名单模式(只有命中gfw才会走代理)

## 编译记录

本人是Openwrt新手，说实话也不太会玩固件，下面是一些编译时候需要的环境，官方提供的环境安装命令并不是很全。

```bash
# 其实应该只要12版本以上就可以了.
# clang/llvm版本低于12的话，bpf-header编译就无法通过。

sudo sh -c 'echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" >> /etc/apt/sources.list'
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

sudo -E apt-get -qq update

sudo apt install -y clang-13 llvm-13
```

```
# GCC还是使用13以上，之前出现编译umiq等依赖时，cflag错误的情况，是版本过低导致的
CONFIG_GCC_USE_VERSION_13=y
```

```
# LTO 优化要关闭，不然xdp编译会出符号引用问题，说实话我很少会怀疑是编译优化导致的编译无法通过, 这次算是长见识了.
# CONFIG_USE_LTO=y
```


## Credits

- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [ActionsRML/delete-workflow-runs](https://github.com/ActionsRML/delete-workflow-runs)
- [dev-drprasad/delete-older-releases](https://github.com/dev-drprasad/delete-older-releases)
- [peter-evans/repository-dispatch](https://github.com/peter-evans/repository-dispatch)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)
