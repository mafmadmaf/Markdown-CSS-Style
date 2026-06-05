function Link(el)
  if el.target and el.target:match("^%[%[") and el.target:match("%]%]$") then
    local page = el.target:gsub("^%[%[", ""):gsub("%]%]$", "")
    el.target = page:gsub(" ", "-") .. ".html"
    el.classes:insert("wikilink")
    el.attributes["data-wikilink"] = "true"
    el.content = { pandoc.Str(page) }
    return el
  end
  if el.classes:includes("wikilink") then
    local page = pandoc.utils.stringify(el.content)
    el.target = page:gsub(" ", "-") .. ".html"
    el.attributes["data-wikilink"] = "true"
    return el
  end
  return el
end

function Pandoc(doc)
  local source = PANDOC_STATE.input_files and PANDOC_STATE.input_files[1]
  if source then
    local filename = source:gsub("^.*[/\\]", "")
    table.insert(doc.blocks, 1, pandoc.RawBlock("html", '<span id="document-title-source">' .. filename .. '</span>'))
  end
  return doc
end
