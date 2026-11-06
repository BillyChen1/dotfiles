#!/bin/bash
# ~/.proxy.sh - SOCKS5代理管理脚本

# 请根据你的实际代理地址修改这里
PROXY_HOST=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
#PROXY_HOST="127.0.0.1"
PROXY_PORT="7897"
PROXY_URL="http://${PROXY_HOST}:${PROXY_PORT}"

proxy_on() {
    export http_proxy="$PROXY_URL"
    export https_proxy="$PROXY_URL"
    export all_proxy="$PROXY_URL"
    export no_proxy="localhost,127.0.0.1,::1"
    echo "✅ SOCKS5代理已开启: $PROXY_URL"
}

proxy_off() {
    unset http_proxy https_proxy all_proxy no_proxy
    echo "✅ 代理已关闭"
}

proxy_status() {
    echo "📊 当前代理环境变量:"
    echo "  http_proxy  = ${http_proxy:-<未设置>}"
    echo "  https_proxy = ${https_proxy:-<未设置>}"
    echo "  all_proxy   = ${all_proxy:-<未设置>}"
}

# 自动完成：如果直接source此脚本时带参数则执行对应函数
# 用法：source ~/.proxy.sh on
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "⚠️  请使用 source 命令加载此脚本，例如: source ~/.proxy.sh"
else
    case "$1" in
        on|ON)   proxy_on ;;
        off|OFF) proxy_off ;;
        status)  proxy_status ;;
        *)       echo "💡 已加载函数: proxy_on, proxy_off, proxy_status" ;;
    esac
fi
