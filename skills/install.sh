#!/usr/bin/env bash
# 一键把 thesis-writing-craft（论文写作方法 skill）装进本机 AI 编码助手的技能目录。
# 用法：
#   bash install.sh          自动检测：装到本机已安装助手的技能目录（有几个装几个）
#   bash install.sh claude   指定装到 ~/.claude/skills （Claude Code）
#   bash install.sh codex    指定装到 ~/.codex/skills  （Codex / OpenAI Codex CLI）
#   bash install.sh zcode    指定装到 ~/.zcode/skills  （ZCode）
#   bash install.sh agents   指定装到 ~/.agents/skills （通用 .agents 约定）
# 只依赖 git 和 cp，不需要 Node。卸载 = 删掉对应目录里的 thesis-writing-craft 文件夹。
set -euo pipefail

REPO="https://github.com/blackfishdel/pcpass-notes"
SKILL="thesis-writing-craft"

want="${1:-auto}"
case "$want" in
  auto|claude|codex|zcode|agents) ;;
  *)
    echo "用法: bash install.sh [claude|codex|zcode|agents]"
    exit 2
    ;;
esac

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
echo "正在下载 ${REPO} …"
git clone --depth 1 --quiet "$REPO" "$tmp/repo"

found=0
for t in claude codex zcode agents; do
  if [ "$want" != "auto" ] && [ "$want" != "$t" ]; then continue; fi
  if [ "$want" = "auto" ] && [ ! -d "$HOME/.$t" ]; then continue; fi
  dest="$HOME/.$t/skills"
  mkdir -p "$dest"
  rm -rf "$dest/$SKILL"
  cp -R "$tmp/repo/skills/$SKILL" "$dest/$SKILL"
  echo "已安装 → ${dest}/${SKILL}"
  found=1
done

if [ "$found" = "0" ]; then
  echo "没检测到已安装的 AI 编码助手。可以先安装一个（如 Claude Code 或 Codex），或手动指定目标："
  echo "  bash install.sh claude    # 装到 ~/.claude/skills"
  echo "  bash install.sh codex     # 装到 ~/.codex/skills"
  exit 1
fi

echo "完成。重启你的 AI 助手后，直接说「帮我搭硕士论文大纲」或「选题太大帮我缩小」即可触发。"
