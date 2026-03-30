#!/bin/bash

# 定义镜像名称和导出的文件名
IMAGE1="docker-trendradar-mcp"
IMAGE2="docker-trendradar"

# 定义导出文件名
TAR1="${IMAGE1}.tar"
TAR2="${IMAGE2}.tar"

echo "开始导出 Docker 镜像..."

# 检查镜像是否存在并导出
if docker images --format "{{.Repository}}" | grep -q "^${IMAGE1}$"; then
    echo "正在导出 ${IMAGE1}..."
    docker save -o "${TAR1}" "${IMAGE1}"
    if [ $? -eq 0 ]; then
        echo "✓ ${IMAGE1} 已成功导出到 ${TAR1}"
    else
        echo "✗ ${IMAGE1} 导出失败"
    fi
else
    echo "✗ 镜像 ${IMAGE1} 不存在"
fi

if docker images --format "{{.Repository}}" | grep -q "^${IMAGE2}$"; then
    echo "正在导出 ${IMAGE2}..."
    docker save -o "${TAR2}" "${IMAGE2}"
    if [ $? -eq 0 ]; then
        echo "✓ ${IMAGE2} 已成功导出到 ${TAR2}"
    else
        echo "✗ ${IMAGE2} 导出失败"
    fi
else
    echo "✗ 镜像 ${IMAGE2} 不存在"
fi

echo "导出完成！"