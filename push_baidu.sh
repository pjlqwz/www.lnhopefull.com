#!/bin/bash
# 百度主动推送脚本
# 使用方法: bash push_baidu.sh

SITE="https://www.lnhopefull.com"
SITEMAP="${SITE}/sitemap.xml"
LOG_FILE="/www/wwwroot/www.lnhopefull.com/push_baidu.log"

# 百度主动推送 API
# Token 需要从百度搜索资源平台获取
BAIDU_TOKEN="rPgqsTqaRWCAZ0HX"
BAIDU_API="http://data.zz.baidu.com/urls?site=${SITE}&token=${BAIDU_TOKEN}"

echo "[$(date)] 百度主动推送开始" >> "$LOG_FILE"

# 检查 sitemap 是否存在
if [ ! -f "/www/wwwroot/www.lnhopefull.com/sitemap.xml" ]; then
    echo "[$(date)] ERROR: sitemap.xml 不存在" >> "$LOG_FILE"
    echo "ERROR: sitemap.xml 不存在"
    exit 1
fi

# 从 sitemap.xml 提取所有 URL
URLS=$(grep -oP '(?<=<loc>)[^<]+' /www/wwwroot/www.lnhopefull.com/sitemap.xml)

if [ -z "$URLS" ]; then
    echo "[$(date)] ERROR: 无法从 sitemap.xml 提取 URL" >> "$LOG_FILE"
    echo "ERROR: 无法提取 URL"
    exit 1
fi

# 转换为一行一个 URL 的格式（百度要求）
URLS_ONE_PER_LINE=$(echo "$URLS" | tr '\n' '\n')

# 推送到百度
RESPONSE=$(curl -s -H "Content-Type: text/plain" \
    --data-binary "$URLS_ONE_PER_LINE" \
    "$BAIDU_API")

echo "[$(date)] 推送请求已发送" >> "$LOG_FILE"
echo "[$(date)] 百度返回: $RESPONSE" >> "$LOG_FILE"

echo "百度推送结果: $RESPONSE"

# 解析返回结果
if echo "$RESPONSE" | grep -q '"success"'; then
    SUCCESS_COUNT=$(echo "$RESPONSE" | grep -oP '"success":\K[0-9]+')
    echo "[$(date)] 成功推送 $SUCCESS_COUNT 个 URL" >> "$LOG_FILE"
    echo "✅ 成功推送 $SUCCESS_COUNT 个 URL"
elif echo "$RESPONSE" | grep -q '"error"'; then
    ERROR_MSG=$(echo "$RESPONSE" | grep -oP '"message":"\K[^"]+')
    echo "[$(date)] 推送失败: $ERROR_MSG" >> "$LOG_FILE"
    echo "❌ 推送失败: $ERROR_MSG"
    exit 1
else
    echo "[$(date)] 未知响应: $RESPONSE" >> "$LOG_FILE"
    echo "⚠️ 未知响应: $RESPONSE"
fi
