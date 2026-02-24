[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/P3TERX/Actions-OpenWrt/blob/master/LICENSE)

- x86 Immortalwrt 主线
- x86 Immortalwrt 25

> 纯新手啥也不会，不会改源码也不会打patch，基本调调配置文件和package，最多就改改内核选项，主打一个原汁原味😢

*配置基本都是本地编译成功之后才会同步到这个仓库，本机和GithubAction使用相同的Ubuntu版本系统，如果意外出现了本地能过CI不能过就...*

## hack

- 修改主机名`ImmortalWrt -> OpenWrt`因为`ImmortalWrt`太长了www
- 默认`192.168.10.1`
- 合并了`QiuSimons/YAOF`的部分`Patch`

## 插件

*不多，主打一个能用就行*

- luci-app-openclash: 估计是目前用的最多的openwrt透明代理插件，经典。
- chinadns-ng: 比较简单易用高性能的dns分流器，因为clash的dns存在性能问题，所以还是得用其他的。
- luci-app-nikki: 另一个clash的openwrt插件，功能对比openclash简单但是够用，并且不使用ruby，对clash配置熟悉可以自己配置推荐使用这个。

## Screenshot

![image](https://github.com/user-attachments/assets/70e64b11-ca06-4d13-84b2-bdcae501520c)


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
