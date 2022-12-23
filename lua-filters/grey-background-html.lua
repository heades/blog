function environment(divContent, format)
  -- divContent : A table of blocks making up the content between the div tags.
  if format == "html" then
      -- a table of inner blocks.
      newDivContent = {}
      newDivContent[1] = pandoc.RawBlock('html', '<div style="background-color: #F0F0F0; padding: 10pt;">')
      -- copy over the existing content in the div.
      i = 2
      for k,v in pairs(divContent) do
        newDivContent[i] = v
        i = i + 1
      end
      newDivContent[i] = pandoc.RawBlock('html', '</div>')
      return newDivContent
  end
end

function Div(el)  
  local id = el.classes[1]
  if id == "grey-background" then
     return environment(el.content, FORMAT)
  end
end
