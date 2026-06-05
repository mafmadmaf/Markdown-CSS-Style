# Markdown CSS Style 验收方案

## 当前阶段

本阶段只制定验收方案，不编写 CSS。

## 验收目标

确认这套 Markdown CSS style 在 VSCode Markdown Preview、iA Writer、Pandoc 三个场景里都能按同一套设计语言显示。

PDF / 打印输出应接近 A4 纸面排版；屏幕预览应根据阅读窗口自适应，不强行显示纸张边界。

## 标准测试 Markdown

验收前需要准备一份标准测试 Markdown，覆盖以下内容：

- H1-H4
- 连续正文段落，用来测试第一自然段缩进、后续连续段落不缩进
- 中文为主，夹少量英文单词和简单英文句子
- 无序列表 3 级
- 有序列表 3 级
- Task List 未完成和已完成
- Blockquote 单段和多段
- Bold
- Emphasis
- Strikethrough
- Highlight
- Inline Code
- Code Block
- Link
- Wikilink
- Footnote
- Table
- Horizontal Rule
- Image
- Caption

当前跳过项只在 CSS 注释中记录，不做视觉验收：

- Content Block
- Math Inline / Math Block
- Tags
- Frontmatter / YAML
- HTML Block
- TOC / Anchor

## 验收路线

### VSCode

用 VSCode Markdown Preview 打开标准测试 Markdown。

检查重点：

- 屏幕阅读版是否自适应
- 正文、标题、引用、列表、代码、表格、图片是否没有明显错位
- Link 前缀、Wikilink 前缀、Emphasis 着重号是否生效
- Task List 自定义符号是否生效

### iA Writer

导入 iA Writer template，分别检查预览和 PDF 导出。

检查重点：

- 预览效果是否保持可读
- PDF 是否使用 A4 纸面排版
- footer 是否显示文件名和当前页码 / 总页码
- 脚注区、图片 caption、打印样式是否生效

### Pandoc

用标准测试 Markdown 导出 HTML 和 PDF。

检查重点：

- HTML 是否保持屏幕阅读效果
- PDF 是否使用 A4 页面、偏右版心和 footer
- Footnote 是否集中在正文之后
- Image 和 Caption 是否按预期显示
- Wikilink 是否能被正确转换

## 通过标准

验收通过需要满足：

- 主要文字层级正确：Body、H1-H4、Blockquote、Code、Table 都符合规格
- PDF 有 A4 版心和 footer
- 屏幕预览不强行显示纸张边界，阅读区舒适
- 没有文字重叠、图片溢出、表格破版
- 已确认的颜色、字号、行高、间距大体一致
- 跳过项在 CSS 注释里明确记录

## 允许的轻微差异

以下差异可以接受，但需要记录：

- 0.2px 线条在不同软件里可能显示成接近值
- Bold 描边在不同渲染器里可能略有差异
- Emphasis 着重号在不同渲染器里可能需要适配
- Link 和 Wikilink 的前缀可能需要按渲染器结构分别处理
- Caption 宽度跟随图片，只有在渲染器输出 figure 结构时才能完全实现

## 失败标准

出现以下情况视为未通过：

- 正文版心明显错误
- PDF footer 缺失或页码无法显示
- 列表、表格、代码块破坏阅读
- 核心样式必须依靠临时后处理才能显示
- 某个目标环境完全无法加载对应样式

## 验收报告格式

每轮测试只报告结果和关键问题，不逐条列出所有用例。

报告格式：

- VSCode：通过 / 未通过，关键问题数量
- iA Writer：通过 / 未通过，关键问题数量
- Pandoc HTML：通过 / 未通过，关键问题数量
- Pandoc PDF：通过 / 未通过，关键问题数量

若未通过，只列关键失败点，并说明问题属于 CSS、渲染器限制，还是 Markdown 结构问题。

## 建议执行顺序

1. Pandoc HTML
2. VSCode Markdown Preview
3. Pandoc PDF
4. iA Writer template

先验收反馈最快的 HTML 和 VSCode，再检查 PDF，最后处理 iA Writer template。
