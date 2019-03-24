print("main.lua start")

BAD_REQUEST=400
OK=200

print("load config.lua")
dofile("config")
print("sda", sda, "scl", scl)

print("load util.lua")
dofile("util.lua")

function init_display(disp)
	disp:setFlipMode(1)

	disp:clearBuffer()
	disp:setContrast(255)
	disp:setFontMode(0)
	disp:setDrawColor(1)
	disp:setBitmapMode(0)

	disp:sendBuffer()
end

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--         MAIN
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
print('init I2C')
i2c.setup(id,sda,scl,i2c.SLOW)

if (false) then
	print('I2C Scan')
	for i=0,127 do
		i2c.start(id)
		resCode = i2c.address(id, i, i2c.TRANSMITTER)
		i2c.stop(id)
		if resCode == true then
			print("We have a device on address 0x" .. string.format("%02x", i) .. " (" .. i ..")")
		end
	end
end

print("init display 1")

disp1 = u8g2.sh1106_i2c_128x64_noname(id, i2c_addr_1)
init_display(disp1)

if (i2c_addr_2 == -1) then
	disp2 = disp1
else
	print("init display 2")
	disp2 = u8g2.sh1106_i2c_128x64_noname(id, i2c_addr_2)
	init_display(disp2)
end

print('load utilDisplay.lua')
dofile('utilDisplay.lua')

print("HTTP server start")
dofile('httpServer.lua')
httpServer:listen(80)

print('mdns start hostname=' .. mdns_name)
mdns.register(mdns_name, { description="dumb_display", service="http", port=80, location='Living Room' })

print('load handler*.lua')
dofile('handleBatch.lua')
dofile('handleClear.lua')
dofile('handleString.lua')
dofile('handleBrightness.lua')
dofile('handlePowersave.lua')
dofile('handleExample.lua')

print('load displayDemo.lua')
dofile('displayDemo.lua')

print('initialize done.')

ip = wifi.sta.getip()
display_demo(disp1, "display1", ip)
display_demo(disp2, "display2", ip)

print('ready.')
