
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



function keywords(line)
	if string.find(line, " AND ") then --make AND and TO into the commas they were always meant to be
		io.write(line:gsub(" AND ", ", "), "\n")
	elseif string.find(line, " TO ") then
		io.write(line:gsub(" TO ", ", "), "\n")
	else
	io.write(line, "\n")
	end

end

function readfileintoarray(filename)
local sourcefilearray = {}
local nline = 1
for line in io.lines(filename) do
sourcefilearray[nline] = line
nline = nline + 1
end
return sourcefilearray
end
 
SOURCEFILE = readfileintoarray(arg[1])

for k,v in pairs(SOURCEFILE) do
keywords(SOURCEFILE[k])
end
