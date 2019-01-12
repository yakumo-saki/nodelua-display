print("main.lua start")

BAD_REQUEST=400
OK=200

id=0  -- 固定値
sda=1
scl=2
addr=0x3C

mdns_name="dumbdisplay"

print('load util.lua')
dofile('util.lua')

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--         MAIN
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
print('init I2C')
i2c.setup(id,sda,scl,i2c.SLOW)

print('I2C Scan')
for i=0,127 do
  i2c.start(id)
  resCode = i2c.address(id, i, i2c.TRANSMITTER)
  i2c.stop(id)
  if resCode == true then
	print("We have a device on address 0x" .. string.format("%02x", i) .. " (" .. i ..")")
  end
end

print('init display')
disp = u8g2.sh1106_i2c_128x64_noname(id, addr)

disp:setFlipMode(1)

disp:clearBuffer()
disp:setContrast(255)
disp:setFontMode(0)
disp:setDrawColor(1)
disp:setBitmapMode(0)

disp:sendBuffer()

print('load utilDisplay.lua')
dofile('utilDisplay.lua')

print("HTTP server start")
dofile('httpServer.lua')
httpServer:listen(80)

print('mdns start ')
mdns.register(mdns_name, { description="dumb_display", service="http", port=80, location='Living Room' })

print('load handler*.lua')
dofile('handleBatch.lua')
dofile('handleClear.lua')
dofile('handleString.lua')
dofile('handleExample.lua')

print('load displayDemo.lua')
dofile('displayDemo.lua')

print('initialize done.')
