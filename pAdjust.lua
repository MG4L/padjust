--// Change this stuff if you need to
local down_key = '[F]'
local up_key = '[G]'
local info_location = {169, 7} -- X, Y Location of where the info box showing ping and sense is located

--// This table can be expanded / lowered / replaced. The scripts adjusts to any valid set.
local sets = {
    [160] = 4.95,
    [165] = 4.85,
    [170] = 4.75,
    [175] = 4.65,
    [180] = 4.55,
    [185] = 4.45,
    [190] = 4.35,
    [195] = 4.25,
}


--// Actual Script //--
local key = dx9.GetKey()
local Lib = loadstring(dx9.Get("https://raw.githubusercontent.com/soupg/DXLibUI/main/main.lua"))()

info_location[2] = info_location[2] - 19 -- Adjusting Offset

--// Init
if Lib.FirstRun then
    for i,v in pairs(sets) do
        _G.Lib.Increment = i -- Sets initial ping as last value from table
    end
    
    dx9.SetAimbotValue("prediction", sets[_G.Lib.Increment])
end

if key == up_key then
    local root = 6969696969

    for i,v in pairs(sets) do 
        if i > _G.Lib.Increment and i < root then
            root = i
        end
    end

    if root ~= 6969696969 then
        _G.Lib.Increment = root
        dx9.SetAimbotValue("prediction", sets[root])
        Lib:Notify("[+] "..root)
    end
elseif key == down_key then
    local root = -6969696969

    for i,v in pairs(sets) do 
        if i < _G.Lib.Increment and i > root then
            root = i
        end
    end
    
    if root ~= -6969696969 then
        _G.Lib.Increment = root
        dx9.SetAimbotValue("prediction", sets[_G.Lib.Increment])
        Lib:Notify("[-] "..root)
    end
end

--// Drawing Box
local text = "PRED: "..sets[_G.Lib.Increment].."   |   PING: "..down_key.." - ".._G.Lib.Increment.." + "..up_key
local length = dx9.CalcTextWidth(text)

dx9.DrawFilledBox( { info_location[1] + 4 , info_location[2] + 19 } , { info_location[1] + 4 + length + 12, info_location[2] + 22 + (18) } , Lib.CurrentRainbowColor )
dx9.DrawFilledBox( { info_location[1] + 5 , info_location[2] + 20 } , { info_location[1] + 3 + length + 12, info_location[2] + 21 + (18) } , Lib.OutlineColor )
dx9.DrawFilledBox( { info_location[1] + 6 , info_location[2] + 21 } , { info_location[1] + 2 + length + 12, info_location[2] + 20 + (18) } , Lib.MainColor )

dx9.DrawString( { info_location[1] + 11 , info_location[2] + 20 } , Lib.FontColor , text )
