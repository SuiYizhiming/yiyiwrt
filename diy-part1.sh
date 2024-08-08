#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#


#编译教程参考https://fairysen.com/819.html

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source 
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages'  >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
echo 'src-git haibo https://github.com/haiibo/openwrt-packages' >>feeds.conf.default
#echo 'src-git liuran001 https://github.com/liuran001/openwrt-packages' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff

#修改编译版本
sed -i 's/^KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=6.1/' ./target/linux/x86/Makefile
 
