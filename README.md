# Markdown CSS Style

本目录实现一套本机使用的 Markdown 样式。

## 文件

- `styles/base.css`：共同设计源。
- `styles/vscode.css`：VSCode Markdown Preview 入口。
- `styles/VSCode-MD-CSS-V1.1.css`：基于 iA Writer V2.9 调整的 VSCode Markdown Preview 样式。
- `styles/pandoc-html.css`：Pandoc HTML 入口。
- `styles/pandoc-pdf.css`：Pandoc PDF 入口。
- `ia-writer/Markdown CSS Style.iatemplate`：iA Writer 模板目录。
- `ia-writer/Markdown CSS Style.clean.iatemplate.zip`：干净的 iA Writer 导入包。
- `samples/standard-test.md`：标准验收 Markdown。
- `filters/wikilinks.lua`：Pandoc Wikilink 转换。

## Pandoc HTML

```sh
pandoc --from markdown+footnotes+task_lists+wikilinks_title_after_pipe --lua-filter filters/wikilinks.lua --standalone --css ../styles/pandoc-html.css samples/standard-test.md --output dist/standard-test.html
```

## Pandoc PDF

当前机器没有可用的 Pandoc PDF 引擎。样式入口已经准备在 `styles/pandoc-pdf.css`，但 PDF 验收需要先安装或启用一个支持 A4 和页码的 PDF 引擎。

## VSCode

在 VSCode 设置里把 Markdown Preview 的 CSS 指向：

```json
"markdown.styles": [
  "/Users/mafmadmaf/Documents/Codex/Markdown CSS Style/styles/VSCode-MD-CSS-V1.1.css"
]
```

## iA Writer

官方模板结构使用 `.iatemplate/Contents/Info.plist` 和 `Contents/Resources/style.css`。本目录已按该结构生成模板。安装后，iA Writer 会复制模板；修改原目录不会自动更新已安装模板。
