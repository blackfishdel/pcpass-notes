#!/usr/bin/env bash
# 把本独立站的 URL 提交给 IndexNow（必应等）。
# 协议要求 key 文件必须由被提交的 host 提供，所以这里用本仓根目录的 <key>.txt，
# 并通过 keyLocation 显式声明位置（主站的 key 文件在 pcpass123.com，不能跨 host 用）。
set -uo pipefail
cd "$(dirname "$0")"

HOST="blackfishdel.github.io"
BASE="https://${HOST}/pcpass-notes"
KEY="89a2f5e1b3c4d5e6f7a8b9c0d1e2f3a4"
KEY_LOCATION="${BASE}/${KEY}.txt"
URLS=(
  "$BASE/" "$BASE/two-rulers.html" "$BASE/free-quota.html" "$BASE/reduce-aigc-flow.html"
  "$BASE/tools.html" "$BASE/faq.html"
  "$BASE/universities-ai-policy-snapshots.html" "$BASE/journal-aigc-reject-line.html"
  "$BASE/journal-aigc-submission-rules.html" "$BASE/reduce-ai-free-entry.html"
  "$BASE/reduce-ai-rate-roundup-review.html" "$BASE/aigc-version-consistency.html"
  "$BASE/joint-comparison-library-entry.html" "$BASE/gbt-7714-2025-citation-format.html"
)

[ "${1:-}" = "--dry-run" ] && { printf '%s\n' "${URLS[@]}"; exit 0; }

payload=$(python3 - "$HOST" "$KEY" "$KEY_LOCATION" "${URLS[@]}" <<'PY'
import json, sys
host, key, key_location, *urls = sys.argv[1:]
print(json.dumps({"host": host, "key": key, "keyLocation": key_location, "urlList": urls}, ensure_ascii=False))
PY
)
code=$(curl -s -o /tmp/indexnow-notes.out -w '%{http_code}' -X POST "https://api.indexnow.org/indexnow" \
  -H 'Content-Type: application/json; charset=utf-8' --data "$payload" --max-time 20)
echo "提交 ${#URLS[@]} 条 → HTTP $code"
case "$code" in 200|202) echo "已接受（200/202）";; *) echo "响应：$(head -c 200 /tmp/indexnow-notes.out)";; esac
