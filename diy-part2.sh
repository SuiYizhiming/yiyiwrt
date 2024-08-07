#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#适配小米路由器的默认地址
sed -i 's/192.168.1.1/192.168.31.100/g' package/base-files/files/bin/config_generate

# 加入编译者信息
sed -i "s/OpenWrt /yiyi build $(TZ=UTC-8 date "+%Y.%m.%d") @ YiyiWrt /g" package/lean/default-settings/files/zzz-default-settings

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
#名称替换openwrt->yiwrt
sed -i '/uci commit system/i\uci set system.@system[0].hostname='YiWrt'' package/lean/default-settings/files/zzz-default-settings
