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

local windows = {}
local dashboard = main:addFrame():setPosition(1, 1):setSize("parent.w", "parent.h")

local dashboardButton = sidebar:addButton():setText("Dashboard"):setBackground(colors.black):setForeground(colors.lightGray):setSize("parent.w - 2", 1):setPosition(2, 2)
    dashboardButton:onClick(function()
        for key, window in pairs(windows) do
            window:hide()
        end
        dashboardButton:setBackground(colors.lightGray)
        dashboardButton:setForeground(colors.white)
        dashboard:show()
    end)
    dashboardButton:onLoseFocus(function()
        dashboardButton:setBackground(colors.black)
        dashboardButton:setForeground(colors.lightGray)
    end)

function updateButtons() --This part of the code adds buttons based on the sub table.
    local y = 4
    for k,v in pairs(windows)do
        local button = sidebar:addButton():setText("Turtle"..k) -- creating the button and adding a name k is just the index
        :setBackground(colors.black)
        :setForeground(colors.lightGray)
        :setSize("parent.w - 6", 1)
        :setPosition(2, y)
        button:onClick(function() -- here we create a on click event which hides ALL sub frames and then shows the one which is linked to the button
            for a, b in pairs(windows)do
                b:hide()
                dashboard:hide()
                v:show()
            end
            button:setBackground(colors.lightGray)
            button:setForeground(colors.white)
        end)
        button:onLoseFocus(function() 
            button:setBackground(colors.black)
            button:setForeground(colors.lightGray)
        end)
        local deleteButton = sidebar:addButton():setText("X"):setBackground(colors.red):setForeground(colors.white):setSize(3, 1):setPosition(12, y)
        deleteButton:onClick(function()
            deleteButton:setBackground(colors.white)
            table.remove(windows, k)
            for key, value in pairs(windows) do
                basalt.debug(key, value)
            end
            updateButtons()
        end)
        y = y + 2
    end
end

dashboard:addButton():setPosition(2, 2):onClick(function()
    table.insert(windows, main:addFrame():setPosition(1, 1):setSize("parent.w", "parent.h"):hide())
    updateButtons()
    end)

basalt.autoUpdate()