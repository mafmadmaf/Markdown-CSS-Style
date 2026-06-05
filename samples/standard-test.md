---
title: Markdown CSS Style Standard Test
---

# 一级标题 H1

这是第一自然段，用来确认段首缩进。This paragraph includes a few English words for mixed-language rhythm.

这是连续正文的第二段，用来确认后续连续段落不缩进。

## 二级标题 H2

### 三级标题 H3

#### 四级标题 H4

- 第一级无序列表
  - 第二级无序列表
    - 第三级无序列表

1. 第一级有序列表
   1. 第二级有序列表
      1. 第三级有序列表

- [ ] 未完成项目
- [x] 已完成项目

> 这是一段引用文字，用来确认细线、字号和缩进。
>
> 这是连续引用段落，用来确认第二段不缩进。

这里有 **Bold**、*Emphasis*、~~Strikethrough~~、<mark>Highlight</mark>、`Inline Code`、[普通链接](https://example.com) 和 [[内部页面]]。

```css
.long-line {
  content: "This code line should wrap instead of forcing the page to overflow horizontally.";
}
```

脚注标记在这里。[^note]

| 项目 | 数值 | 说明 |
| --- | --- | --- |
| Body | 13px | 正文 |
| Code | 11px | 代码 |

---

![设计稿局部](../A4%20-%20bold_Emphasis_Strikethrough_Highlight.svg)

<figure>
  <img src="../A4%20-%20bold_Emphasis_Strikethrough_Highlight.svg" alt="Figure image">
  <figcaption>这是一条图片说明文字。</figcaption>
</figure>

[^note]: 这是脚注内容，用来确认脚注区样式。
