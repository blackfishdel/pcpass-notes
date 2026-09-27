# 论文查重与 AIGC 自查笔记（GitHub Pages）

我们是 PCPASS 团队。这个站点用来放**方法性长文**，并给出指向主站工具页的正常链接（可被引擎跟随）。

## 为什么要有这个站

内容平台（知乎 / CSDN / cnblogs）上我们发的文章，外链实测全是 `nofollow` 或干脆不放行外链（见 `../pcpass-seo-pages/docs/产品增长/21-300俱乐部对照与改造清单-2026-09-27.md`）——它们能给曝光，但**不给我们域传权重**。GitHub Pages 上的链接默认没有 `nofollow`，且站点完全可控，这是我们目前成本最低、可持续的"可跟随外链"来源。

## 目录结构

| 文件 | 内容 |
| --- | --- |
| `index.html` | 首页：这是做什么的 + 三张入口卡 |
| `two-rulers.html` | 查重与 AIGC 是两把尺子 |
| `free-quota.html` | 免费额度怎么用 |
| `reduce-aigc-flow.html` | 降 AI 的三步流程 |
| `tools.html` | 自查工具清单（链到主站 8 个工具页） |
| `faq.html` | 常见问题 |
| `assets/style.css` | 全站样式（单文件，无 JS） |
| `sitemap.xml` / `robots.txt` | 收录用 |
| `set-origin.sh` | 把占位域名 `__ORIGIN__` 替换为站点真实地址 |

## 站点地址

**https://blackfishdel.github.io/pcpass-notes/**（2026-09-27 上线，Pages 已生效）

- 仓库：`git@github.com:blackfishdel/pcpass-notes.git`，`main` 与 `gh-pages` 两个分支内容一致。
- 线上核对：首页与 6 个内页 200，指向主站的链接 **nofollow 计数 0**，canonical/sitemap 已指向本域名。
- IndexNow：本仓根目录放有 key 文件，`./push-indexnow.sh` 可把 6 个 URL 提交给必应（协议要求 key 文件由被提交的 host 提供，所以不能复用主站的 key）。

## 发布步骤（已执行，留档备查）

1. 在 GitHub 建一个 **Public** 仓库，名字建议 `pcpass-notes`（不要勾选 README，避免冲突）。
2. 本地接上远端并推送：
   ```bash
   cd pcpass-notes
   git remote add origin git@github.com:<你的用户名>/pcpass-notes.git
   git push -u origin main
   ```
3. 仓库 **Settings → Pages → Source: Deploy from a branch → Branch: main / (root)**，保存。
4. 一两分钟后站点地址是 `https://<你的用户名>.github.io/pcpass-notes/`。
5. 把站点地址写回页面（canonical / og:url / sitemap / robots）：
   ```bash
   ./set-origin.sh https://<你的用户名>.github.io/pcpass-notes
   git add -A && git commit -m "chore: 设置站点地址" && git push
   ```
6. 收录：把首页与 6 个内页提交给必应（可加进 `../pcpass-seo-pages/script/push-indexnow.sh` 的 URL 列表，或直接用必应站长工具的 URL 提交）。

## 维护规则

- **不复制主站原文**：同一篇文章出现在两个域会造成重复内容，两边都不占优。新内容要重写，或写主站不放的角度。
- 新增页面：加进 `sitemap.xml`，并在这份 README 的目录表里登记。
- 站内互链 + 每页至少一条链回主站对应工具页（这是这个站存在的意义）。
- 合规红线与主站一致：不写包过 / 保证 / 一定过；数据引用带口径；终检一律写明以学院或期刊指定系统为准。
- 已验证：页面里的外链**没有** `rel="nofollow"`；全站无 JS、无外部依赖，样式单文件。

## 现状

- 6 个页面，均为 2026-09-27 撰写，未走主站 `detect:aigc` 检测门（该门是内容平台发文的要求，不适用于本独立站；如需也可补跑）。
