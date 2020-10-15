--[[
this is a comment
]] print("hello world")

name = "amirphl"
ANOTHER_NUMBER = 'mahdiphl'
io.write("String \"amirphl\" size is :", #name, "\n")

local bigInt = 2222222222222222222222 + 1
io.write("Big num ", bigInt, "\n")
io.write("Big num ", type(bigInt), "\n")
io.write("Float ", 1.999999999999 + 0.00000000000055, "\n")
io.write("Note: 13 digits precision", "\n")
local longStr = [[
    I am a long string
    and this is a new line ]]
print(longStr .. " and I want to be appended")
IsAbleTo = true
print(type(IamNil))
print(5.2 % 3)
-- todo why math.random always returns the highest number
print(math.random(5.6, 9.4))
print(math.randomseed(os.time()))
print(string.format("Pi = %.10f", math.pi)) -- only 13 digits
-------------------------------
-------------------------------
-------------------------------
print(5 ~= 4)
if 5 == 5 then
    local phl = 'phl'
elseif (5 == 5) and (4 == 4) then
    print("nooo I must no be printed")
end
print("print(local) causes error here")
print(tostring(not true or 4 < 6))
print("local canVote = 5 > 6 ? true : false -- not works in luq")
local canVote = 18 > 6 and true or false
print(string.len("salam"))
print(string.gsub("salam", "sa", "SA"))
print(string.find("this is a string", "string"))
print(string.upper("this is a string"))
-------------------------------
-------------------------------
-------------------------------
local i = 0
print("i++ not works in lua")
print("i += 1 not works in lua")
print("continue in while or for not works in lua")
while i <= 10 do
    io.write(i)
    i = i + 1
    if i == 8 then break end
end
print()

repeat
    i = i - 1
    io.write(i)
until i > 0

print("use io.read() to get user input")
-- local guess = io.read()
-- print("your guess ", guess)

for i = 1, 10, 1 do io.write(i) end
print()

local months = {'april', 'june', 'july'}

for k, v in pairs(months) do print(k, v) end

--- tables
print("table examples")
local aTable = {}
for i = 1, 10 do aTable[i] = i end
print(i)
print(#aTable)
print(aTable[1])
table.insert(aTable, 1, {"salam how are you?"})
print(aTable[1][1])
print("print(table.concat(aTable, \",\")) not works")
table.remove(aTable, 1)
print(aTable[1])
table.remove(aTable, 5)
print(table.concat(aTable, ","))

--- funcs
print("function examples")
function getSumAndMultiply(arg1, arg2, arg3)
    return arg1 + arg2 + arg3, arg1 * arg2 * arg3
end
local mySum, muMultiply = getSumAndMultiply(1, 5, 6)
print(mySum, muMultiply)
print("print(getSum(1, 5, \" hi\")) not works here")
for s in string.gmatch("the ninja and knight", "[^%s]+") do print(s) end

local functionWithInfiniteParams = function(...)
    local s = 0
    for k, v in pairs {...} do s = s + v end
    return s
end

print(functionWithInfiniteParams(1, 3, 4, 34, 3, 4, 34, 3, 4, 3, 4, 34))

--- clojure
print("clojure examples")
function outerFunction(arg1, arg2, arg3)
    local i = 0
    return function()
        i = i * i + 1
        return i
    end
end

io.write(outerFunction()(), " , ")
io.write(outerFunction()(), " , ")
io.write(outerFunction()(), " , ")
io.write(outerFunction()(), " , ")
io.write(outerFunction()(), " , ")
io.write(outerFunction()(), " , ")
io.write(outerFunction()(), " , ")
print()

-- compare next result with previous one
local payAttentionToMe = outerFunction()
io.write(payAttentionToMe(), " , ")
io.write(payAttentionToMe(), " , ")
io.write(payAttentionToMe(), " , ")
io.write(payAttentionToMe(), " , ")
io.write(payAttentionToMe(), " , ")
print()

--- coroutine
print("coroutine examples")
coroutine1 = coroutine.create(function()
    for i = 1, 10 do
        print(i, coroutine.status(coroutine1))
        if i == 5 then coroutine.yield() end
    end
end)

print(coroutine.status(coroutine1))
coroutine.resume(coroutine1)
print(coroutine.status(coroutine1))

coroutine2 = coroutine.create(
                 function() for i = 1, 100 do io.write(i, " ,") end end)
print()
coroutine.resume(coroutine2)
print(coroutine.status(coroutine2))
coroutine.resume(coroutine1)
print(coroutine.status(coroutine1))

--- files
print("file api examples")
local file = io.open("salam.txt", "w+")
-- modes: r+, w+, a+, r, w, a
file:write("Hi i am first line \n")
file:write("Hi i am second line \n")
file:write("Hi i am third line \n")
file:seek("set", 10)
print(file:read())
print("----")
print(file:read("*a"))
file:seek("set", 22)
print(file:read())
print("----")
print(file:read("*a"))
file:close()

--- modules
print("modules examples")

local convertModule = require("convert")
print(convertModule.ftToCm(1000))

--- meta tables
print("meta tables examples")
local anotherTable = {}
for i = 0, 10 do anotherTable[i] = i end
local mt = {
    __add = function(table1, table2)
        local s = {}
        for i = 1, #table1 do
            if table1[i] ~= nil and table2[i] ~= nil then
                s[i] = table1[i] + table2[i]
            else
                s[i] = 0
            end
        end
        return s
    end,
    __eq = function(t1, t2) return t1.value == t2.value end,
    __lt = function(t1, t2) return t1.value < t2.value end,
    __le = function(t1, t2) return t1.value <= t2.value end
}
-- todo what is table.value?
setmetatable(anotherTable, mt)
print(anotherTable == anotherTable)
local addTable = anotherTable + anotherTable

for i = 1, #addTable do io.write(addTable[i], " ,") end
print()

--- oop
print("oop examples")
Animal = {h = 0, w = 0, name = "", sound = ""}

function Animal:new(h, w, n, s)
    setmetatable({}, Animal)
    self.h = h
    self.w = w
    self.name = n
    self.sound = s
    return self
end

function Animal:toString() return self.name .. "|" .. self.sound end

local spot = Animal:new(10, 15, "happy", "Woof")
print(spot.w)
print(spot:toString())

Cat = Animal:new()

function Cat:new(h, w, n, s, anotherParam)
    setmetatable({}, Cat)
    self.h = h
    self.w = w
    self.name = n
    self.sound = s
    self.anotherP = anotherParam
    return self
end

local fluppy = Cat:new(10, 17, "Khushul", "Tuna", "Another paramu")
print(fluppy.anotherP)
