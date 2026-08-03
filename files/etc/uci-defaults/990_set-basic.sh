#!/bin/sh
# MT6000 基础网络设置(从 M2 迁移) - 首次启动执行一次
# 基于设备默认端口布局,仅改关键字段,不覆盖整个 network

# WAN: PPPoE 拨号(沿用 M2 的宽带账号)
uci set network.wan.proto='pppoe'
uci set network.wan.username='13828704144'
uci set network.wan.password='246515'
uci set network.wan.ipv6='auto'
uci set network.wan.norelease='1'

# LAN: 主路由网段(沿用 M2)
uci set network.lan.ipaddr='192.168.1.1'
uci set network.lan.netmask='255.255.255.0'

# 主机名/时区
uci set system.@system[0].hostname='ImmortalWrt'
uci set system.@system[0].timezone='CST-8'

uci commit network
uci commit system

exit 0
