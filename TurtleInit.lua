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

--local turtleName = main:addLabel()
    --turtleName:setText("This is " .. hostName)
    --turtleName:setPosition(11, 8)

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

local loadingAnimation = main:addProgressBar()
loadingAnimation:setPosition(11, 8)
loadingAnimation:setSize(10, 1)
loadingAnimation:setBackground(colors.white)
loadingAnimation:setForeground(colors.green)

function animaneProgress()
    loadingAnimation:setProgress(0)
    for i = 1, 10 do
        loadingAnimation:setProgress(i * 10)
        if i == 10 then
            loadingAnimation:setBackground(colors.green)
            loadingAnimation:setForeground(colors.white)
        end
    end
    sleep(1)
end

local doAnimate = false
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
    pairText:setText("Broadcasting, check host computer.")
    pairText:setPosition(8, 5)
    doAnimate = true
    while doAnimate do
        animaneProgress()
    end
end

basalt.autoUpdate()