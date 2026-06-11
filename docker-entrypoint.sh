#!/bin/sh
set -e
# 默认值（与.env.production一致）
VITE_GRAPHQL_URI="${VITE_GRAPHQL_URI:-http://50.17.76.198:8082/graphql}"
VITE_SERVER_URI="${VITE_SERVER_URI:-http://50.17.76.198.11:8082}"
# 替换JS文件中的占位符为实际运行时环境变量
find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
"s|__VITE_GRAPHQL_URI_PLACEHOLDER__|${VITE_GRAPHQL_URI}|g" {} +
find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
"s|__VITE_SERVER_URI_PLACEHOLDER__|${VITE_SERVER_URI}|g" {} +
echo "Configured VITE_GRAPHQL_URI=${VITE_GRAPHQL_URI}"
echo "Configured VITE_SERVER_URI=${VITE_SERVER_URI}"
exec nginx -g 'daemon off;'