httpServer:use('/string', function(req, res)

	ret = drawString(req.query.x, req.query.y, req.query.text, req.query.fontmode, req.query.fontcolor, req.query.fontsize, req.query.direction)

	if (ret ~= '') then
		res:status(BAD_REQUEST)
		res:send(ret)
		return
	end

	disp:sendBuffer()
	res:status(OK)
	res:send('OK')

end)
