local basalt = require("basalt")

local main = basalt.createFrame():setTheme({FrameBG = colors.lightGray, FrameFG = colors.black})

local modem = peripheral.find("modem", rednet.open)

local hostName = "eMHost" .. os.getComputerID()

local sidebar = main:addFrame():setBackground(colors.gray):setPosition("parent.w", 1):setSize(15, "parent.h"):setZIndex(25)
:onGetFocus(function(self)
    basalt.debug("parent.w - (self.w-1)")
    basalt.debug(type("parent.w - (self.w-1)"))
    self:setPosition("parent.w - (self.w-1)")
end)
:onLoseFocus(function(self)
    self:setPosition("parent.w")
end)

-- Once again we add 3 frames, the first one should be immediatly visible
local sub = {
    main:addFrame():setPosition(1, 1):setSize("parent.w", "parent.h"),
    main:addFrame():setPosition(1, 1):setSize("parent.w", "parent.h"):hide(),
    main:addFrame():setPosition(1, 1):setSize("parent.w", "parent.h"):hide(),
}

--This part of the code adds buttons based on the sub table.
local y = 2
for k,v in pairs(sub)do
    sidebar:addButton():setText("Example "..k) -- creating the button and adding a name k is just the index
    :setBackground(colors.black)
    :setForeground(colors.lightGray)
    :setSize("parent.w - 2", 3)
    :setPosition(2, y)
    :onClick(function() -- here we create a on click event which hides ALL sub frames and then shows the one which is linked to the button
        for a, b in pairs(sub)do
            b:hide()
            v:show()
        end
    end)
    y = y + 4
end

sub[1]:addButton():setPosition(2, 2)

sub[2]:addLabel():setText("Hello World!"):setPosition(2, 2)

sub[3]:addLabel():setText("Now we're on example 3!"):setPosition(2, 2)
sub[3]:addButton():setText("No functionality"):setPosition(2, 4):setSize(18, 3)

basalt.autoUpdate()