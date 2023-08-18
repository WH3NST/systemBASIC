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

function reverse(t)
  local n = #t
  local i = 1
  while i < n do
    t[i],t[n] = t[n],t[i]
    i = i + 1
    n = n - 1
  end
end

Pstring = "init"

function randomstring(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end

function evaluate(line)
	local noprint = 0
	if string.find(line, "$var") then       --EVALUATE VARIABLE CREATION
	noprint = 1
		if string.find(line, [["]]) then
			io.write("STRING_ ", mysplit(line, " ")[2], ", ", mysplit(line, " = ")[3], "\n")
			else
			io.write("DIM_ ", mysplit(line, " ")[2], ", ", mysplit(line, " = ")[3], "\n")
		end
	elseif string.find(line, " = ") then
	io.write("MOVE_ ", mysplit(line, " = ")[1], ", ", mysplit(line, " = ")[2], "\n")
	end
	if string.find(line, "%(") then	       --EVALUATE FUNCTION CALL/SUBROUTINE CALL
	noprint = 1
		ARGSTRING = mysplit(mysplit(line, "%(")[2], "%)")[1]
		ARGUMENTS = mysplit(ARGSTRING, ", ")
		for k,v in pairs(ARGUMENTS) do
		io.write("ARG_i ", ARGUMENTS[k], "\n")
		end
		io.write("GOSUB_ ", mysplit(line, "%(")[1], "\n")
		if string.find(line, " %>%> ") then
		io.write("STORE_ ", mysplit(line, "%>%>")[2], "\n")
		end
		
	end
	
	if string.find(line, "%[") then	       --GET ARGUMENTS FOR A FUNCTION
	noprint = 1
		ARGSTRING = mysplit(mysplit(line, "%[")[2], "]")[1]
		io.write("FUNCTION_ ", mysplit(line, "%[")[1], "\n")
		ARGUMENTS = mysplit(ARGSTRING, ", ")
		reverse(ARGUMENTS)
		for k,v in pairs(ARGUMENTS) do
			io.write("DIM_ ", ARGUMENTS[k], ", 0\n")
			io.write("ARG_o ", ARGUMENTS[k], "\n")
		end
	end
	if string.find(line, "return ") then
	noprint = 1	
		io.write("RETURN_ ", mysplit(line, " ")[2], "\n")
	end
	
	if string.find(line, "while %|") then
		--mysplit(mysplit(line, "%|")[2], "%|")[1]
		noprint = 1
		if string.find(line, "==") then
			endlabel = randomstring(18)
			io.write("IFTRUE_ ", endlabel, "\n")
			io.write("COMPARE_neq ", mysplit(mysplit(mysplit(line, "%| ")[2], " %|")[1], " == ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "==")[2], "\nCONTINUE_")
			io.write("WHILE_ \n", "COMPARE_eq ", mysplit(mysplit(mysplit(line, "%| ")[2], " %|")[1], " == ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "==")[2], "\n")
			end
			
		if string.find(line, "!=") then
			endlabel = randomstring(18)
			io.write("IFTRUE_ ", endlabel, "\n")
			io.write("COMPARE_eq ", mysplit(mysplit(mysplit(line, "%| ")[2], " %|")[1], " != ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "!=")[2], "\nCONTINUE_\n")
			io.write("WHILE_ \n", "COMPARE_neq ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], " != ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "!=")[2], "\n")
			end
			
		if string.find(line, "<") then
			endlabel = randomstring(18)
			io.write("IFTRUE_ ", endlabel, "\n")
			io.write("COMPARE_geq ", mysplit(mysplit(mysplit(line, "%| ")[2], " %|")[1], " %< ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "%<")[2], "\nCONTINUE_\n")
			io.write("WHILE_ \n", "COMPARE_les ", mysplit(mysplit(mysplit(line, "%| ")[2], " %|")[1], " %< ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "%<")[2], "\n")
			end
			
		if string.find(line, ">") then
			endlabel = randomstring(18)
			io.write("IFTRUE_ ", endlabel, "\n")
			io.write("COMPARE_leq", mysplit(mysplit(mysplit(line, "%| ")[2], " %|")[1], " %> ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "%>")[2], "\nCONTINUE_\n")
			io.write("WHILE_ \n", "COMPARE_gre ", mysplit(mysplit(mysplit(line, "%| ")[2], " %|")[1], " %> ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "%>")[2], "\n")
			end
			
		if string.find(line, "=<") then
			endlabel = randomstring(18)
			io.write("IFTRUE_ ", endlabel, "\n")
			io.write("COMPARE_les ", mysplit(mysplit(mysplit(line, "%| ")[2], " %|")[1], " =%< ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "=%<")[2], "\nCONTINUE_\n")
			io.write("WHILE_ \n", "COMPARE_geq ", mysplit(mysplit(mysplit(line, "%| ")[2], " %|")[1], " =%< ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "=%<")[2], "\n")
			end

		if string.find(line, "=>") then
			endlabel = randomstring(18)
			io.write("IFTRUE_ ", endlabel, "\n")
			io.write("COMPARE_geq ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], " =%> ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "=%>")[2], "\nCONTINUE_\n")
			io.write("WHILE_ \n", "COMPARE_leq ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], " =%> ")[1], ", ", mysplit(mysplit(mysplit(line, "%|")[2], "%|")[1], "=%>")[2], "\n")
			end

	end
	if string.find(line, "STOP") then
	io.write("CONTINUE_\n")
	io.write("LOCALSUB_ ", endlabel, "\n")
	noprint = 1
		end
		
if string.find(line, "+") then
noprint = 1
io.write("ARITH_add ",mysplit(line, "+ ")[1], ", ", mysplit(mysplit(line, "+")[2], "%>%>")[1], "\nSTORE_", mysplit(mysplit(line, "+")[2], "%>%>")[2], "\n") 
end

if string.find(line, "-") then
noprint = 1
io.write("ARITH_sub ",mysplit(line, "- ")[1], ", ", mysplit(mysplit(line, "-")[2], "%>%>")[1], "\nSTORE_", mysplit(mysplit(line, "-")[2], "%>%>")[2], "\n") 
end

if string.find(line, "*") then
noprint = 1
io.write("ARITH_mul ",mysplit(line, "* ")[1], ", ", mysplit(mysplit(line, "*")[2], "%>%>")[1], "\nSTORE_", mysplit(mysplit(line, "*")[2], "%>%>")[2], "\n") 
end

if string.find(line, "/") then
noprint = 1
io.write("ARITH_div ",mysplit(line, "/ ")[1], ", ", mysplit(mysplit(line, "/")[2], "%>%>")[1], "\nSTORE_", mysplit(mysplit(line, "/")[2], "%>%>")[2], "\n") 
end
if ( noprint == 0 ) then
io.write(line, "\n")
else
io.write("")
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
evaluate(SOURCEFILE[k])
end
