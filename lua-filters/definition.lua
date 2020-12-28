function environment(id, body, format, label)
  if format == "latex" then        
     return {
      pandoc.RawBlock('latex', '\\begin{'..id..'}\\label{'..label..'}'),
      pandoc.Plain(body),
      pandoc.RawBlock('latex', '\\end{'..id..'}')
      }
  elseif format == "html" then
      return {
      pandoc.RawBlock('html', '<div class="'..id..'">'),
      pandoc.Plain(body),
      pandoc.RawBlock('html', '</div>')
      }
  end
end

function Div(el)
  local id = el.classes[1]
  if id == "definition" or
     id == "lemma"      or
     id == "theorem"    or
     id == "corollary"  then
     local label = el.attributes["label"]
     local body = el.content[1].content
     return environment(id, body, FORMAT, label)
  end
end
