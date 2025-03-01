local basalt = require("basalt")

local main = basalt.createFrame()

local modem = peripheral.find("modem", rednet.open)
if modem == nil then
    basalt.debug("No modem found")
end

local hostName = "eMaTurtle" .. os.getComputerID()

rednet.host("eMaHostPair", hostName)

local notConnected = true
while notConnected do
    
end

basalt.autoUpdate()