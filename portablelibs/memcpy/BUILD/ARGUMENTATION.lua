function readfileintoarray(filename)
local sourcefilearray = {}
local nline = 1
for line in io.lines(filename) do
sourcefilearray[nline] = line
nline = nline + 1
end
return sourcefilearray
end

function mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

function randomstring(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end


local function isInteger(str)

  return not (str == "" or str:find("%D"))

end

function evaluate(line)
	local args = mysplit(line, " ")
	local myvar = {}
	local stringthing = {}
	for k,v in pairs(args) do
		if isInteger(args[k]) then
			local varname = randomstring(14)
			table.insert(stringthing, " ")
			table.insert(stringthing, varname)
			myvar[k] = varname
		else
		table.insert(stringthing, " ")
		table.insert(stringthing, args[k])
		end
	end
	for k,v in pairs(myvar) do
		if ( myvar[k] == "" ) then
		else
		io.write("\n")
		io.write("$var ", myvar[k], " = ", args[k])
		io.write("\n")
		end
	end
	for k,v in pairs(stringthing) do
		io.write(stringthing[k])
		end
	io.write("\n")
return
end
SOURCEFILE = readfileintoarray(arg[1])

for k,v in pairs(SOURCEFILE) do --evaluate source file, convert to systemBASIC code
if string.find(SOURCEFILE[k], "$var") then
io.write(SOURCEFILE[k])
else
evaluate(SOURCEFILE[k])
end
io.write("\n")
end
