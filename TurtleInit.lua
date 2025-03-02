local basalt = require("basalt")

local main = basalt.createFrame()

local modem = peripheral.find("modem", rednet.open)

local hostName = "eMaTurtle" .. os.getComputerID()

local pairLabel = main:addLabel()
    pairLabel:setText("Pairing")
    pairLabel:setPosition(10, 2)
    pairLabel:setFontSize(2)

local pairText = main:addLabel()
    pairText:setText("Click to start pairing to host.")
    pairText:setPosition(6, 5)

local turtleName = main:addLabel()
    turtleName:setText("This is " .. hostName)
    turtleName:setPosition(11, 14)

local stopPairButton = main:addButton()
    stopPairButton:hide()
    stopPairButton:setPosition(14, 7)
    stopPairButton:setText("Stop")
    stopPairButton:setBackground(colors.red)
    stopPairButton:setForeground(colors.white)
    stopPairButton:setSize(13, 3)
    stopPairButton:onClick(function() 
        stopPairButton:setBackground(colors.white)
    end)
    stopPairButton:onRelease(function() 
        stopPairButton:setBackground(colors.red)
        stopPairing()
    end)

local pairButton = main:addButton()
    pairButton:setPosition(14, 7)
    pairButton:setText("Broadcast")
    pairButton:setBackground(colors.green)
    pairButton:setForeground(colors.white)
    pairButton:setSize(13, 3)
    pairButton:onClick(function() 
        pairButton:setBackground(colors.white)
    end)
    pairButton:onRelease(function() 
        pairButton:setBackground(colors.green)
        pairWithHost()
    end)

function stopPairing()
    rednet.unhost("eMaHostPair")
    stopPairButton:hide()
    pairButton:show()
    pairText:setText("Click to start pairing to host.")
    pairText:setPosition(6, 5)
    
end

function pairWithHost()
    rednet.host("eMaHostPair", hostName)
    stopPairButton:show()
    pairButton:hide()
    pairText:setText("Broadcasting, check host.")
    pairText:setPosition(8, 5)
end

basalt.autoUpdate()