function CodeBlock(block)
  if block.classes[1] == "latex-disp-img" then
     if FORMAT == "latex" then     
        return pandoc.Para{ pandoc.Math("DisplayMath",block.text) }
     else
         local src = block.attributes["src"]
         local cap = block.attributes["cap"]
         return pandoc.Para{ pandoc.Image(cap, src) }
     end
  end
end
