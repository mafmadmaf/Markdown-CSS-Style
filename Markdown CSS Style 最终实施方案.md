# Markdown CSS Style 最终实施方案

## 当前阶段

实施时必须以本文件为准；如发现本文件和设计稿或后续确认冲突，先停下来确认，不做猜测补丁。

## 输出目标

本专案需要输出一套 Markdown CSS style，用于：

- VSCode Markdown Preview
- iA Writer
- Pandoc HTML
- Pandoc PDF

实现方式：

- 共同设计源保持一致
- VSCode 使用屏幕预览样式
- iA Writer 输出为一个 `.iatemplate`，模板内使用合并后的单一 `style.css`
- Pandoc 同时支持 HTML 和 PDF，其中 PDF 使用 A4 打印版面

## 基础字体

- 正文主字体：`ChillKai`
- 代码字体：`Source Code Pro`
- Footer 字体：`Source Code Pro`
- 使用场景仅限本机电脑，不为其他电脑做复杂字体兼容

## 基础颜色

- 页面背景：`#ffffff`
- 正文颜色：`#000000`
- Blockquote 竖线：`#cccccc`
- Inline Code / Code Block 背景：`#CCD6E6`
- Highlight 背景：`#E9FF9A`
- Image 边框：`#cccccc`

## A4 / Print 版面

设计稿 A4 尺寸：

- 页面宽度：595px
- 页面高度：842px

正文版心：

- x：135px
- y：85px
- 宽度：375px
- 高度：637px
- 右边界：510px
- 左留白：135px
- 右留白：85px

Footer：

- x：135px
- y：790px
- 宽度：375px
- 高度：10px
- 左侧文件名 x：135px
- 左侧文件名宽度：270px
- 右侧页码 x：405px
- 右侧页码宽度：105px
- 右侧页码对齐：右对齐
- Footer 字体：`Source Code Pro`
- Footer 字号：8px
- Footer 内容：左侧显示文件名，右侧显示当前页码 / 总页码

说明：

- Figma 左侧的 H1、body、Blockquote 等红色或标注文字只用于识别样式，不进入最终 CSS。
- PDF / 打印版保留偏右版心。

## Screen 版面

屏幕预览用于 VSCode Markdown Preview 和 HTML 阅读。

- 不显示 A4 纸张边界
- 正文最大宽度：375px
- 正文栏保留偏右视觉
- 宽窗口时左侧预留空间：135px
- 窄窗口时左右安全边距：24px
- 窄窗口下允许减少左侧预留空间，优先保证可读性

## Body

- 字体：`ChillKai`
- 字号：13px
- 行高：23px
- 颜色：`#000000`
- 段后距：10px
- 正文宽度：375px
- 第一自然段段首缩进：需要
- 连续正文的第二段及之后：不缩进

段首缩进值：

- 先用 26px 实施
- 原因：Figma 中缩进由文本开头空格形成，不是独立 CSS 数值；26px 是按 13px 正文视觉估算
- 验收时需要对照输出效果微调

## Headings

通用规则：

- 字体：`ChillKai`
- 颜色：`#000000`
- 不加粗
- 不加线
- 不自动编号
- 只用字号、间距、缩进区分层级

H1：

- 字号：24px
- 行高：normal

H2：

- 字号：16px
- 行高：normal

H3：

- 字号：13px
- 行高：normal

H4：

- 字号：13px
- 行高：normal
- 左缩进：26px

H5 / H6：

- 当前版本不定义
- 需要写入 CSS 注释

## Lists

通用规则：

- 字体：`ChillKai`
- 字号：13px
- 行高：23px
- 列表项段后距：0px
- 列表整体与前后内容间距：10px
- 列表保留自身缩进
- 列表不使用 Body 的段首缩进

无序列表：

- 第 1 级：实心圆点
- 第 2 级：空心圆点
- 第 3 级：方块

有序列表：

- 第 1 级：`1.`
- 第 2 级：`a.`
- 第 3 级：`i.`

## Task List / Checkbox

- 字体：`ChillKai`
- 字号：13px
- 行高：23px
- 列表项段后距：0px
- 保留普通列表缩进
- 不使用浏览器默认 checkbox
- 未完成项目符号：`☐`
- 完成项目符号：`☒`
- 符号和文字间距：3px
- 已完成项文字颜色：`#000000`
- 已完成项文字使用删除线
- 删除线粗细：0.2px
- 删除线颜色：跟随文字颜色

说明：

- VSCode、iA Writer、Pandoc 的 task list HTML 结构可能不同，实施时需要分别适配。

## Blockquote

- 版心内起点 x：135px
- 左竖线宽度：0.2px
- 左竖线颜色：`#cccccc`
- 引用文字 x：155px
- 竖线到文字距离：20px
- 引用文字宽度：355px
- 字体：`ChillKai`
- 字号：11px
- 行高：20px
- 上下间距：10px
- 引用内第一自然段缩进：26px
- 连续引用段落：不缩进

## Bold

- 不使用 `font-weight: 700` 作为首选方案
- 使用同色轻微描边
- 描边值：0.2px
- 描边颜色：跟随文字颜色
- 不改变字号
- 不改变行高
- 不改变颜色
- 不改变段距
- 如果实测效果不好，再尝试浏览器模拟加粗

## Emphasis

- 不使用斜体
- 使用中文着重号效果
- 表现为文字下方黑色小圆点
- 不改变字号
- 不改变行高
- 不改变颜色
- 不改变段距

## Strikethrough

- 删除线粗细：0.2px
- 删除线颜色：跟随文字颜色
- 不改变字号
- 不改变行高
- 不改变颜色
- 不改变段距

## Highlight

- 背景色：`#E9FF9A`
- 文字颜色不变
- 不改变字号
- 不改变行高
- 不改变段距

## Inline Code

- 字体：`Source Code Pro`
- 字号：11px
- 背景色：`#CCD6E6`
- 圆角：2px
- 边框：无
- 内边距上：0px
- 内边距右：2px
- 内边距下：0px
- 内边距左：2px
- 行高：尽量跟随所在文字层级，不额外撑高正文行距

## Code Block

- 字体：`Source Code Pro`
- 字号：11px
- 行高：15px
- 背景色：`#CCD6E6`
- 圆角：2px
- 边框：无
- 内边距上：8px
- 内边距右：10px
- 内边距下：8px
- 内边距左：10px
- 代码块内部段后距：0px
- 代码块结束后与后续正文间距：10px
- 长代码行：自动换行

## Link

- 颜色：跟随上下文文字颜色
- 文字前缀：`↗ `
- 前缀和文字之间：1 个空格
- 下划线：需要
- 下划线粗细：0.2px
- 下划线距离文字：3px
- hover：不变化
- visited：不变化
- 字号、行高、段距：跟随所在文字层级

说明：

- 可优先用 CSS 伪元素添加 `↗ `，但 VSCode、iA Writer、Pandoc 需要实测。

## Wikilink

- 只显示页面名
- 不显示 `[[ ]]`
- 文字前缀：`↙ `
- 前缀和页面名之间：1 个空格
- 颜色：跟随上下文文字颜色
- 下划线：需要
- 下划线粗细：0.2px
- 下划线距离文字：3px
- hover：不变化
- visited：不变化

说明：

- CSS 不能稳定删除普通文本中的 `[[ ]]`。
- 要实现只显示页面名，需要渲染器本身支持 wikilink，或导出前将 wikilink 转换为链接结构。

## Footnote

正文脚注标记：

- 显示为上标

脚注区：

- 字体：`ChillKai`
- 字号：8px
- 行高：12px
- 脚注区上方间距：60px
- 分隔横线：无
- 编号：默认数字

说明：

- CSS 不能把分散在正文中的脚注内容移动到全文最后。
- 当渲染器已经把脚注集中到文末时，CSS 才负责样式。

## Table

- 表格宽度：375px
- 表格宽度规则：撑满版心
- 字体：`ChillKai`
- 字号：11px
- 行高：15px
- 表头：不加粗
- 外边框：0.2px
- 外边框颜色：`#000000`
- 内部横线：0.2px `#000000`
- 内部竖线：0.2px `#000000`
- 单元格内边距上：3px
- 单元格内边距右：5px
- 单元格内边距下：3px
- 单元格内边距左：5px

## Horizontal Rule

- 宽度：375px
- 宽度规则：撑满版心
- 颜色：`#000000`
- 粗细：0.2px
- 上方间距：35px
- 下方间距：45px

## Image

- 左对齐版心
- 不居中
- 高度：180px
- 宽度：按原图比例自动伸缩
- 最大宽度：375px
- 圆角：0px
- 边框：0.2px
- 边框颜色：`#cccccc`
- 图片上方间距：25px
- 图片下方间距：25px

## Caption

- 指图片说明文字
- 位置：图片下方
- 字体：`ChillKai`
- 字号：7px
- 行高：10px
- 颜色：`#000000`
- Caption 与图片距离：4px
- 左对齐图片
- Caption 宽度：尽量跟随对应图片宽度

说明：

- 如果 Markdown 输出为 `<figure><img><figcaption>`，caption 宽度可以跟随图片。
- 如果渲染器只输出普通图片段落，caption 可能只能退到 375px 版心宽度。

## 当前版本明确跳过，但必须写入 CSS 注释

以下样式当前版本不实现，但 CSS 文件中必须用 comment 记录：

- Content Block
- Math Inline / Math Block
- Tags
- Frontmatter / YAML
- HTML Block
- TOC / Anchor
- H5 / H6

## 当前版本未定义，也必须写入 CSS 注释

以下项目为完整 Markdown / Pandoc 输出中可能出现的样式，但当前版本不定义，避免范围扩张：

- Definition List
- Superscript / Subscript
- Keyboard Input
- Abbreviation
- Marked inserted / deleted text
- Metadata title block
- Bibliography / References
- Figure 外层结构
- Manual page break
- Long table 跨页规则

## 需要实测确认的风险点

以下不是最终样式缺失，而是现实渲染差异，需要在验收时确认：

- 0.2px 线条在不同软件中可能显示为接近值
- Bold 的 0.2px 同色描边在 VSCode、iA Writer、Pandoc PDF 中可能效果不同
- Emphasis 着重号需要确认三种输出是否都支持
- Link / Wikilink 前缀依赖伪元素或渲染结构，需要实测
- Wikilink 是否能只显示页面名，取决于渲染器或预处理
- Footnote 是否集中到文末，取决于渲染器
- Caption 宽度是否跟随图片，取决于是否输出 figure 结构
- Footer 当前页码 / 总页码在不同 PDF 输出路线中实现方式不同，需要按工具分别处理

## 实施顺序

1. 建立标准测试 Markdown
2. 建立共同基础 CSS
3. 建立 VSCode 入口样式
4. 建立 Pandoc HTML / PDF 入口样式
5. 建立 iA Writer `.iatemplate`
6. 按验收方案执行测试
7. 只针对失败项修正，不做未确认样式扩张

## 完成标准

实施完成必须满足：

- 本文件中所有“已定义样式”都有对应实现
- 本文件中所有“跳过”和“未定义”项目都写入 CSS 注释
- VSCode、iA Writer、Pandoc HTML、Pandoc PDF 都完成验收
- 验收报告明确区分通过、失败数量和关键问题
- 没有依靠临时后处理假装实现 CSS 本身无法完成的功能
