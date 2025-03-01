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
    pairText:setText("This is " .. hostName)
    pairText:setPosition(19, 8)

local stopPairButton = main:addButton()
    stopPairButton:hide()
    stopPairButton:setPosition(15, 7)
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
    pairButton:setPosition(15, 7)
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
    
end

function pairWithHost()
    rednet.host("eMaHostPair", hostName)
    stopPairButton:show()
    pairButton:hide()
    pairText:setText("Broadcasting, check host computer.")
end

basalt.autoUpdate()