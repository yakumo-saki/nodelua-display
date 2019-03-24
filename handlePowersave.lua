-- https://github.com/olikraus/u8g2/wiki/u8g2reference#setcontrast
httpServer:use('/powersave', function(req, res)

	disp = get_display(req.query.disp)

	-- 変な値でもnilが帰る
	value = tonumber(req.query.value)
	if (value ~= nil) then
		if (0 <= value and value <= 1) then
			disp:setPowerSave(value)
		end
	else
		res:send('please use value parameter (0-1)')
	end

	if (ret ~= '') then
		res:status(BAD_REQUEST)
		res:send(ret)
		return
	end

	-- disp:sendBuffer()
	res:status(OK)
	res:send('OK')

end)
