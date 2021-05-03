#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate
#Disable root password
sed -i '33s/^/# /' package/lean/default-settings/files/zzz-default-settings

# Add a feed source
echo "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default 
echo "src-git lienol https://github.com/Lienol/openwrt-package" >> feeds.conf.default
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default

#lcui-add
git clone https://github.com/rosywrt/luci-theme-rosy.git package/rosy
git clone https://github.com/zyltzero/OpenClash.git package/OpenClash
git clone https://github.com/frainzy1477/luci-app-clash.git package/clash
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone https://github.com/zyltzero/Lienol-obsolete.git package/passwall
git clone https://github.com/tty228/luci-app-serverchan.git package/serverchan
./scripts/feeds update -a && ./scripts/feeds install -a
