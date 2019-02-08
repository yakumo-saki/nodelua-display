httpServer:use('/clear', function(req, res)
	disp = get_display(req.query.disp)

	clearDisplay(disp)
	disp:sendBuffer()

	res:status(OK)
	res:send('OK')
end)
