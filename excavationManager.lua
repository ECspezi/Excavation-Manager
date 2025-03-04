local basalt = require("basalt")

local main = basalt.createFrame():setTheme({FrameBG = colors.lightGray, FrameFG = colors.black})

local modem = peripheral.find("modem", rednet.open)

local hostName = "eMHost" .. os.getComputerID()

local sidebar = main:addFrame():setBackground(colors.gray):setPosition("parent.w", 1):setSize(15, "parent.h"):setZIndex(25)
:onGetFocus(function(self)
    self:setPosition("parent.w - (self.w-1)")
end)
:onLoseFocus(function(self)
    self:setPosition("parent.w")
end)

-- Once again we add 3 frames, the first one should be immediatly visible
local windows = {
    main:addFrame():setPosition(1, 1):setSize("parent.w", "parent.h"),
}

--This part of the code adds buttons based on the sub table.
local y = 2
for k,v in pairs(sub)do
    sidebar:addButton():setText("Turtle "..k) -- creating the button and adding a name k is just the index
    :setBackground(colors.black)
    :setForeground(colors.lightGray)
    :setSize("parent.w - 2", 1)
    :setPosition(2, y)
    :onClick(function() -- here we create a on click event which hides ALL sub frames and then shows the one which is linked to the button
        for a, b in pairs(sub)do
            b:hide()
            v:show()
        end
    end)
    y = y + 4
end

windows[1]:addButton():setPosition(2, 2):onClick(function() main:addFrame():setPosition(1, 1):setSize("parent.w", "parent.h") end)
    
end-- EXAMPLE

basalt.autoUpdate()