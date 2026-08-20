#!/bin/bash
# ============================================
# dannishoo AP8220 定制脚本
# 基于 VIKINGYFY/OpenWRT-CI
# ============================================

# --- 移除 api-ap8220.sh（512M QWRT分区检查）---
# AP8220没有QWRT分区，这个脚本会导致sysupgrade失败
rm -f ./target/linux/qualcommax/base-files/lib/upgrade/api-ap8220.sh 2>/dev/null
echo "Removed api-ap8220.sh (512M partition check bypassed)"

# --- 确保daed的依赖kmod在编译树里存在 ---
# 检查kmod-sched-bpf是否在netsupport.mk里
if grep -q 'KernelPackage/sched-bpf' ./package/kernel/linux/modules/netsupport.mk; then
    echo "kmod-sched-bpf: found in source"
else
    echo "WARNING: kmod-sched-bpf not found in netsupport.mk"
fi

if grep -q 'KernelPackage/xdp-sockets-diag' ./package/kernel/linux/modules/netsupport.mk; then
    echo "kmod-xdp-sockets-diag: found in source"
else
    echo "WARNING: kmod-xdp-sockets-diag not found in netsupport.mk"
fi
