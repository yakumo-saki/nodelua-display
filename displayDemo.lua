-- https://github.com/olikraus/u8g2/wiki/fntlistall#6-pixel-height

function display_demo(disp, msg)
	disp:clearBuffer()

	-- OK
	disp:setFontMode(0)
	disp:setDrawColor(1)
	-- disp:setDrawColor(0)  BAD ! Black background
	disp:setFont(u8g2.font_6x10_tf)
	disp:drawStr(2, 12, "ABCDEFGabcdefg0123456789")
	disp:sendBuffer()

	-- OK
	disp:setFontMode(0)
	disp:setDrawColor(1)
	disp:setFont(u8g2.font_unifont_t_symbols)
	disp:drawStr(2, 28, "ABCDEFGabcdefg0123456789")
	disp:sendBuffer()

	-- circle
	disp:drawCircle(20, 40, 10, u8g2.DRAW_ALL)
	disp:drawCircle(30, 50, 10, u8g2.DRAW_ALL)
	disp:drawCircle(40, 40, 10, u8g2.DRAW_ALL)
	disp:drawCircle(50, 50, 10, u8g2.DRAW_ALL)
	disp:drawCircle(60, 40, 10, u8g2.DRAW_ALL)

	disp:drawFrame(90, 30, 10, 20)
	disp:drawBox(110, 30, 10, 20)
	disp:drawFrame(0, 0, 128, 64)

	disp:setFont(u8g2.font_6x10_tf)
	disp:drawStr(80, 60, msg)
	disp:sendBuffer()
end
