httpServer:use('/clear', function(req, res)
	clearDisplay()
	disp:sendBuffer()

	res:status(OK)
	res:send('OK')
end)
