-- 自作split関数
function split(str, delim)
	-- Eliminate bad cases...
	if string.find(str, delim) == nil then
			return { str }
	end

	local result = {}
	local pat = "(.-)" .. delim .. "()"
	local lastPos
	for part, pos in string.gfind(str, pat) do
			table.insert(result, part)
			lastPos = pos
	end
	table.insert(result, string.sub(str, lastPos))
	return result
end

function split2(str, ts)
	-- 引数がないときは空tableを返す
	if ts == nil then return {} end

	local t = {} ;
	i=1
	for s in string.gmatch(str, "([^" .. ts .. "]+)") do
	  t[i] = s
	  i = i + 1
	end

	return t
end
