function CodeBlock(block)
  if block.classes[1] == "latex-disp-img" then
     if FORMAT == "latex" then     
        return pandoc.Para{ pandoc.Math("DisplayMath",block.text) }
     else
         local input_width = block.attributes["width"]
         local src = block.attributes["src"]
         local cap = block.attributes["cap"]
         local image = pandoc.Image(cap, src)
         if input_width ~= nil then
            image.attributes["style"] = 'margin:auto; display: block;width:'..input_width..';'
         else
            image.attributes["style"] = 'margin:auto; display: block;'
         end
         return pandoc.Para{ image }
     end
  end
end
