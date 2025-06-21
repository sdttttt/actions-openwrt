[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/P3TERX/Actions-OpenWrt/blob/master/LICENSE)

能编译以下固件~

- x86 Immortalwrt 主线
- x86 Immortalwrt 24.10

> 纯新手啥也不会，不会改源码也不会打patch，基本调调配置文件和package，最多就改改内核选项，主打一个原汁原味😢

*配置基本都是本地编译成功之后才会同步到这个仓库，本机和GithubAction使用相同的Ubuntu版本系统，如果意外出现了本地能过CI不能过就...*

## hack

- 抢占模式改为了动态抢占`PREEMPT_DYNAMIC`
- 修改主机名`ImmortalWrt -> OpenWrt`因为`ImmortalWrt`太长了www
- 默认`192.168.10.1`
- 合并了`QiuSimons/YAOF`的部分`Patch`

## 插件

*不多，主打一个能用就行*

- luci-app-openclash: 估计是目前用的最多的openwrt透明代理插件，经典。
- chinadns-ng: 比较简单易用高性能的dns分流器，因为clash的dns存在性能问题，所以还是得用其他的。
- luci-app-nikki: 自己渐渐能开始玩转Linux的网络模块了，OpenClash对我来说处处都有限制，开始尝试能裸核心的插件. nikki可以关闭代理但开启核心，这样转发规则可以完全自己控制。
- luci-app-homeproxy: 基于sing-box的代理工具，缺点是对比clash配置难度全方位增高，并且核心配置迭代频繁，非代理工具老司机慎用。(目前本人裸核心使用)

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
