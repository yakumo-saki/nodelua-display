-- Custom API
-- Get text/html
httpServer:use('/welcome', function(req, res)
	-- if error in this function. nodemcu will reboot
	if (req.query.name ~= nil) then
		res:send('Hello ' .. req.query.name)
	else
		res:send('Hello null. please use name parameter') -- /welcome?name=doge
	end
end)

httpServer:use('/test', function(req, res)
	-- if error in this function. nodemcu will reboot
	if (req.query.name ~= nil) then
		res:send("length " .. #req.query.name)
	end
end)
