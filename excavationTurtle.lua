local basalt = require("basalt")

local main = basalt.createFrame()

local modem = peripheral.find("modem", rednet.open)
if modem == nil then
    basalt.debug("No modem found")
end

local hostName = "eMaTurtle" .. os.getComputerID()

local pairLabel = main:addLabel()
    pairLabel:setText("Pair this turtle")
    pairLabel:setPosition(10, 2)
    pairLabel:setFontSize(2)

local pairText = main:addLabel()
    pairText:setText("Click to start pairing to host")
    pairText:setPosition(5, 5)

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
    
end

function pairWithHost()
    rednet.host("eMaHostPair", hostName)
    stopPairButton:show()
    pairButton:hide()
end

basalt.autoUpdate()