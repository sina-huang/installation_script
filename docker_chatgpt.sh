#!/bin/bash

# 创建目录 /home/chatgpt
mkdir -p /home/chatgpt

# 为用户提示输入 OPENAI_API_KEY
read -p "请输入您的 OPENAI_API_KEY：" openai_api_key

# 编写 docker-compose.yml 文件
cat > /home/chatgpt/docker-compose.yml <<EOF
services:
  app:
    image: chenzhaoyu94/chatgpt-web:main
    ports:
      - 3002:3002
    environment:
      OPENAI_API_KEY: ${openai_api_key}
EOF

echo "已经在 /home/chatgpt 目录下创建了 docker-compose.yml 文件并添加了 OPENAI_API_KEY 变量。"

# 切换到 /home/chatgpt 目录并使用 docker-compose 启动服务。
cd /home/chatgpt
docker compose up -d