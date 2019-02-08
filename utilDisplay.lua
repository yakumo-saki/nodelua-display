function clearDisplay(disp)
	disp:clearBuffer()
end

function drawString(disp, x, y, text, pfontmode, pfontcolor, pfontsize, pdirection)
	if (x == nil) then
		return 'Error: parameter y is nil'
	end
	if (y == nil) then
		return 'Error: parameter y is nil'
	end
	if (text == nil) then
		return 'Error: parameter text is nil'
	end

	direction=pdirection or 0

	fontsize=u8g2.font_6x10_tf
	if (pfontsize == "l") then
		fontsize=u8g2.font_unifont_t_symbols
	elseif (pfontsize == "xl") then
		fontsize=u8g2.font_courR18_tf
	end

	fontmode=pfontmode or 1
	fontcolor=pfontcolor or 1

	disp:setFontPosTop()
	disp:setFontMode(fontmode)
	disp:setDrawColor(fontcolor)
	disp:setFont(fontsize)
	disp:setFontDirection(direction)
	disp:drawStr(x, y, text)

	return ""
end

function get_display(num)
	disp_num = num or 1

	if num == "2" then
		print("disp = 2")
		return disp2
	end

	print("disp = 1")
	return disp1
end
