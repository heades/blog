function environment(id, body, format, label)
  content = {}
  if format == "latex" then
     -- Create the latex content blocks.
     --   1. Start the latex environment id with label.
     content[1] = pandoc.RawBlock('latex', '\\begin{'..id..'}\\label{'..label..'}')
     --   2. Since body is list of blocks, we need to add each othem to the content table.
     block_count = 1
     for i,bi in pairs(body) do
          content[i+1] = bi
          block_count = block_count + 1
     end
     -- Close the latex environment id with \end{id}.
     content[block_count+1] = pandoc.RawBlock('latex', '\\end{'..id..'}')

     -- Return out newly formated block.
     return content
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
     local body = el.content     
     return environment(id, body, FORMAT, label)
  end
end
