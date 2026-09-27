#!/usr/bin/env bash
# 把页面里的占位域名 __ORIGIN__ 换成站点真实地址。
# 用法：./set-origin.sh https://<用户名>.github.io/pcpass-notes
set -euo pipefail
[ $# -eq 1 ] || { echo "用法: $0 https://<用户名>.github.io/pcpass-notes"; exit 1; }
origin="${1%/}"
grep -rl "__ORIGIN__" . --include='*.html' --include='*.xml' --include='*.txt' \
  | while read -r f; do sed -i '' "s|__ORIGIN__|${origin}|g" "$f"; echo "已更新 $f"; done
# index.html 的 canonical 指向目录根
sed -i '' "s|${origin}/index.html|${origin}/|g" index.html
echo "完成。记得 git add -A && git commit && git push"
