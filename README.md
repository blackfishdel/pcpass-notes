# PCPASS 方法笔记站

这个仓库是 **https://blackfishdel.github.io/pcpass-notes/** 的源文件：把论文查重与 AIGC 自查的做法整理成可以照着做的步骤，由 PCPASS 团队维护。

## 页面

| 文件 | 内容 |
| --- | --- |
| `index.html` | 首页：这个站写什么、三条主线，以及选题笔记入口 |
| `two-rulers.html` | 查重与 AIGC 是两把尺子 |
| `free-quota.html` | 免费额度怎么用 |
| `reduce-aigc-flow.html` | 降 AI 的三步流程 |
| `tools.html` | 自查工具清单 |
| `faq.html` | 常见问题 |
| `universities-ai-policy-snapshots.html` | 22 所高校官网快照：规则大多查不到 |
| `journal-aigc-reject-line.html` | 期刊 AIGC 退稿线：两个样本都指向 20% |
| `journal-aigc-submission-rules.html` | 期刊投稿的三层 AIGC 规则 |
| `reduce-ai-free-entry.html` | 免费降 AI 免的是哪一步 |
| `reduce-ai-rate-roundup-review.html` | 4 篇降 AI 横评的核查笔记 |
| `aigc-version-consistency.html` | 检测版本要和送审版本一致 |
| `joint-comparison-library-entry.html` | 联合比对库没有个人入口 |
| `gbt-7714-2025-citation-format.html` | GB/T 7714-2025 实施后的两个坑 |
| `guides-index.html` | 指南目录：主站全部 51 篇指南按七组收录的入口页，含知乎/CSDN 平台镜像节（新平台文章发布后往该节追加链接） |
| `assets/style.css` | 全站样式（单文件，无 JS） |
| `sitemap.xml` / `robots.txt` | 收录用 |

## 怎么改

全站是纯静态页面，没有构建步骤，改完直接提交即可。

- **改文案**：编辑对应的 `.html`。
- **新增页面**：复制现有页面的 `<head>`、导航与页脚结构；把新页面加进 `sitemap.xml`；需要的话在导航里补链接。
- **换域名**：`./set-origin.sh https://新地址`（会替换页面里的 canonical、og:url 与 sitemap、robots 中的地址）。
- **通知搜索引擎**：`./push-indexnow.sh`（key 文件在本仓根目录，提交给必应等参与 IndexNow 的引擎）。

## 写作准则

- 面向读者：先讲清做法，再给入口；不确定的事不写。
- 结论要能落地：给出可执行的顺序和检查项，而不是口号。
- 自我约束：不写保证类措辞，也不承诺过线；涉及学校要求的地方写明以学院或期刊通知为准。
