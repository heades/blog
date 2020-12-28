function Div(el)
  if el.classes[1] == "definition" then
     local label = el.attributes["label"]
     if FORMAT == "latex" then        
        return {
         pandoc.RawBlock('latex', '\\begin{definition}\\label{'..label..'}'),
         pandoc.Plain(el.content[1].content),
         pandoc.RawBlock('latex', '\\end{definition}')
         }
     elseif FORMAT == "html" then
         return {
         pandoc.RawBlock('html', '<div class="definition">'),
         pandoc.Plain(el.content[1].content),
         pandoc.RawBlock('html', '</div>')
         }
     end
  end
end
