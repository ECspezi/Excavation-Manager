local basalt = require("basalt")
local main = basalt.createFrame()

local pairLabel = main:addLabel()
    pairLabel:setText("Pair this turtle")
    pairLabel:setPosition(10, 4)
    pairLabel:setFontSize(2)
    
basalt.autoUpdate()