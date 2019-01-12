httpServer:use('/batch', function(req, res)

	if (req.query.cmd == nil) then
		res:status(BAD_REQUEST)
		res:send('Error: parameter cmd is nil')
		return
	end

	print(req.query.cmd)

	for cmdstr in string.gmatch(req.query.cmd, "%n") do
		print(cmdstr)

		-- for param in string.gmatch(cmdstr, "\t") do
		-- 	print(param)
		-- end

		print("cmdstr end")

		cmd_params = split(cmdstr, ",")
		print(#cmd_params)
		print(cmd_params)
		for p in cmd_params do
			print(p)
		end
	end

	-- ret = drawString(req.query.x, req.query.y, req.query.text, req.query.fontmode, req.query.fontcolor, req.query.fontsize, req.query.direction)
	ret = ""
	if (ret ~= "") then
		res:status(BAD_REQUEST)
		res:send(ret)
		return
	end

	disp:sendBuffer()
	res:status(OK)
	res:send('OK ' .. req.query.cmd)

end)
