# PCPASS 方法笔记站

这个仓库是 **https://blackfishdel.github.io/pcpass-notes/** 的源文件：把论文查重与 AIGC 自查的做法整理成可以照着做的步骤，由 PCPASS 团队维护。

## 页面

| 文件 | 内容 |
| --- | --- |
| `index.html` | 首页：这个站写什么，以及三条主线 |
| `two-rulers.html` | 查重与 AIGC 是两把尺子 |
| `free-quota.html` | 免费额度怎么用 |
| `reduce-aigc-flow.html` | 降 AI 的三步流程 |
| `tools.html` | 自查工具清单 |
| `faq.html` | 常见问题 |
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
