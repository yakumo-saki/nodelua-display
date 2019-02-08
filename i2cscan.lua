function i2cscan()
	print('I2C Scan ', node.random(1000))
	print("=========")
	for i=0,127 do
		i2c.start(id)
		resCode = i2c.address(id, i, i2c.TRANSMITTER)
		i2c.stop(id)
		if resCode == true then
			print("We have a device on address 0x" .. string.format("%02x", i) .. " (" .. i ..")")
		end
	end
end

print('load config')
dofile('config.lua')

print("sda", sda,"scl", scl)

print('init I2C')
i2c.setup(id,sda,scl,i2c.SLOW)

local mytimer = tmr.create()

i2cscan()
mytimer:register(3000, tmr.ALARM_AUTO, function (t) i2cscan(); end)
mytimer:start()
