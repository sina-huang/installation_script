#!/bin/bash

*# 更新软件包列表*

apt-get update

*# 安装基础软件包和 Docker 相关工具*

apt-get install ca-certificates curl gnupg lsb-release -y

*# 创建目录并下载 Docker GPG 密钥*

mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

*# 添加 Docker 源到软件包源列表中*

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

*# 再次更新软件包列表*

apt-get update

*# 安装 Docker CE、CLI、Containerd、Buildx 和 Compose*

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y