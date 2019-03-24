-- https://github.com/olikraus/u8g2/wiki/u8g2reference#setcontrast
httpServer:use('/brightness', function(req, res)

	-- 変な値でもnilが帰る
	value = tonumber(req.query.value)
	if (value ~= nil) then
		if (0 <= value and value <= 255) then
			if disp1 ~= nil then
				disp1:setContrast(value)
			end
			if disp2 ~= nil then
				disp2:setContrast(value)
			end
		end
	else
		res:send('please use value parameter (0-255)')
	end

	if (ret ~= '') then
		res:status(BAD_REQUEST)
		res:send(ret)
		return
	end

	-- setContrastはバッファを送信する必要がない
	-- disp:sendBuffer()
	res:status(OK)
	res:send('OK')

end)
